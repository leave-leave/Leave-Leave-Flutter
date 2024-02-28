import 'package:flutter/material.dart';
import 'package:tteonatteona/post/widget/post_add.dart';
import 'package:tteonatteona/post/widget/post_details.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import '../model/post_check.dart';


class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  int likeCount = 12;
  bool isLiked = false;

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

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<List<PostCheck>> fetchPosts() async {
    Dio dio = Dio();
    List<PostCheck> posts = [];

    try {
      List<PostCheck> posts = await fetchPosts();
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

    return posts;
  }


  Future<void> like(String feedId) async {
    Dio dio = Dio();

    try {
      final resp = await dio.post(
        "$baseUrl/likes/$feedId",
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

  Future<void> likedelete(String feedId) async {
    Dio dio = Dio();

    try {
      final resp = await dio.delete(
        "$baseUrl/likes/$feedId",
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
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostDetails()),
              );
            },
            child: Container(
              height: 375,
              margin: EdgeInsets.only(left: 24, right: 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Icon(
                        Icons.account_circle,
                        color: Color(0xff2B8AFB),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '서예린',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 220),
                      Icon(Icons.delete)
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 34),
                    child: Image.asset('assets/images/post.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30),
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
                        icon: isLiked
                            ? Icon(Icons.favorite, size: 24, color: Colors.blue)
                            : Icon(Icons.favorite_border,
                            size: 24, color: Colors.blue),
                      ),
                      Text(likeCount.toString()),
                      IconButton(
                        onPressed: () {
                          // Add functionality for comments button
                        },
                        icon: Icon(Icons.mode_comment_outlined,
                            size: 24, color: Colors.blue),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      '나는 영국에 왔어',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
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
