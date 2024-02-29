import 'package:flutter/material.dart';
import 'package:tteonatteona/post/widget/post_add.dart';
import 'package:tteonatteona/post/widget/post_details.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import '../model/post_check.dart';

class Post extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String content;

  const Post({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  int likeCount = 12;
  bool isLiked = false;
  late List<PostCheck> posts;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> postDelete(String feedId) async {
    Dio dio = Dio();

    try {
      final resp = await dio.delete(
        "$baseUrl/feeds/$feedId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      print(resp.statusCode);
    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }


  Future<void> fetchPosts() async {
    Dio dio = Dio();
    posts = [];

    try {
      final resp = await dio.get(
        "$baseUrl/feeds",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      if (resp.statusCode == 200) {
        resp.data.forEach((item) {
          posts.add(PostCheck.fromJson(item));
        });
        print('게시물 조회 성공');
      } else {
        print('게시물 조회 실패. 상태 코드: ${resp.statusCode}');
      }
    } catch (e) {
      print('에러: $e');
      throw Exception(e);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 25),
              Text(
                '게시물',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 280),
              SizedBox(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostAdd()),
                    );
                  },
                  icon: Icon(Icons.add, size: 24),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                    padding: EdgeInsets.only(top: 4),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PostDetails()),
                          );
                        },
                        child: Container(
                          height: 375,
                          margin: EdgeInsets.only(left: 24, right: 24, bottom: 22),
                          padding: EdgeInsets.only(left: 33, right: 33),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(Icons.account_circle_outlined, size: 30, color: Color(0xff2B8AFB),),
                                  SizedBox(width : 8),
                                  Text('서예린'),
                                  SizedBox(width: 190),
                                  IconButton(onPressed: (){
                                    setState(() {
                                      posts.removeAt(index);
                                    });
                                  }, icon: Icon(Icons.delete, color: Color(0xff2B8AFB),))
                                ],
                              ),
                              SizedBox(height: 9),
                              Image.network(widget.imageUrl, fit: BoxFit.fill),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                        if (isLiked) {
                                          likeCount++;
                                        } else {
                                          likeCount--;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      isLiked ? Icons.favorite : Icons.favorite_border,
                                      size: 24,
                                      color: isLiked ? Color(0xff2B8AFB): null,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){
                                    },icon: Icon(Icons.mode_comment_outlined, size : 24)
                                  )
                                ],
                              ),
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(widget.content),
                            ],
                          ),
                        ),
                      );
                    },
            ),
            ),
        ],
      ),
    );
  }
}
