import 'package:flutter/material.dart';
import 'package:tteonatteona/post/widget/post_add.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
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
              IconButton(
                padding: EdgeInsets.only(left: 295),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostAdd()),
                  );
                },
                icon: Icon(Icons.add, size: 24),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 363,
            margin: EdgeInsets.only(left: 24, right: 24),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
