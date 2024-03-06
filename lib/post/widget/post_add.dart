import 'package:tteonatteona/post/widget/post_upload_complete.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tteonatteona/secret.dart';
import 'package:tteonatteona/post/widget/post.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  late String title;
  late String content;
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  Image? _displayImage;
  bool _isImageUploaded = false;
  String imageUrl = "https://leaveleave.s3.ap-northeast-2.amazonaws.com/5c2bde45-e90e-44d8-bbac-745f490d61f8";

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    title = '';
    content = '';
  }

  Future<void> pickImage(ImageSource gallery) async {
    _pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_pickedImage != null) {
      setState(() {
        _displayImage = Image.file(
          File(_pickedImage!.path),
        );
        _isImageUploaded = true;
      });
      await uploadImageAndGetUrl(_pickedImage!.path);
    } else {
      setState(() {
        _displayImage = null;
        _isImageUploaded = false;
      });
    }
  }

  Future<void> uploadImageAndGetUrl(String imagePath) async {
    Dio dio = Dio();

    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imagePath, filename: "image.jpg"),
      });

      final resp = await dio.post(
        "$baseUrl/file/upload",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      String imageUrl = resp.data["url"];
      postContent(title, content, imageUrl);
      print(resp.statusCode);
    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }

  Future<void> postContent(String title, String content, String imageUrl,) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "title": title,
      "content": content,
      "imageUrl": imageUrl,
    };
    try {
      final resp = await dio.post(
        "$baseUrl/feeds",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
        data: jsonEncode(data),
      );
      print(resp.statusCode);
      print(jsonEncode(data));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Post(
              title: title,
              content: content,
              imageUrl: imageUrl
          ),
        ),
      );
    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffECF3FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  icon: Icon(Icons.arrow_back, size: 20),
                ),
                Text(
                  '게시물 등록',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 16,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 364,
                height: 740,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 34, top: 52),
                          child: Icon(Icons.image, size: 32, color: Color(0xff699BF7)),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 254,
                          height: 40,
                          margin: EdgeInsets.only(top: 52),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextButton(
                            onPressed: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: Text(
                              '사진 추가',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Noto Sans KR',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    _displayImage != null
                        ? Container(
                      margin: EdgeInsets.only(left: 45),
                      width: 250,
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(_pickedImage!.path)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : Container(
                      margin: EdgeInsets.only(left: 45),
                      width: 250,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Color(0xffC7C5C5),
                      ),
                    ),
                    SizedBox(height: 19),
                    Row(
                      children: [
                        SizedBox(width: 34),
                        Icon(Icons.location_on, size: 32, color: Color(0xff699BF7)),
                        SizedBox(width: 10),
                        Container(
                          width: 254,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                title = value;
                              });
                            },
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: '제목을 입력하세요',
                              hintStyle: TextStyle(
                                height: 1.0,
                                fontSize: 13,
                                color: Color(0xffd9d9d9),
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w500,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27),
                    Row(
                      children: [
                        SizedBox(width: 34),
                        Icon(Icons.edit, size: 32, color: Color(0xff699BF7)),
                        SizedBox(width: 10),
                        Container(
                          width: 254,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                content = value;
                              });
                            },
                            textAlign: TextAlign.start,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: '내용을 입력하세요',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: Color(0xffd9d9d9),
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w500,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(11.0, 6.0, 0, 12.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Post(
                                    title: title,
                                    content: content,
                                    imageUrl: imageUrl
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff3792FD),
                            minimumSize: Size(90, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            '등록',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Noto Sans KR',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
