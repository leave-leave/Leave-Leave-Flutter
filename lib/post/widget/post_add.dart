import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tteonatteona/post/widget/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tteonatteona/post/widget/post_upload_complete.dart';
import 'package:tteonatteona/secret.dart';
import 'package:dotted_border/dotted_border.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  Image? _displayImage;
  bool _isImageUploaded = false;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> pickImage() async {
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
        "$baseUrl/upload",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      String imageUrl = resp.data["url"];
      postContent(titleController.text, contentController.text, imageUrl);
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
            imageUrl: imageUrl,
            title: title,
            content: content,
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
      body: Column(
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
                  SizedBox(height: 36),
                  Container(
                    width: 296,
                    height: 230,
                    color: Color(0xffd9d9d9),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(4),
                      color: Color(0xff000000),
                      strokeWidth: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 290),
                          _displayImage != null ? SizedBox(
                            width: 296,
                            height: 220,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: _displayImage,
                            ),
                          ) : Icon(Icons.image, size: 35, color: Color(0xff699BF7)),
                          SizedBox(height: 5),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 100,
                            height: _isImageUploaded ? 0 : 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: pickImage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    '사진추가',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Noto Sans Kr',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 19),
                  Row(
                    children: [
                      SizedBox(width: 34),
                      Icon(Icons.location_on,
                          size: 32, color: Color(0xff699BF7)),
                      SizedBox(width: 10),
                      Container(
                        width: 254,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          controller: titleController,
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
                          controller: contentController,
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
                          print(titleController.text);
                          print(contentController.text);
                          String imageUrl = "h";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Post(
                                imageUrl: imageUrl,
                                title: titleController.text,
                                content: contentController.text,
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
    );
  }
}
