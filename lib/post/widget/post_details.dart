import 'package:flutter/material.dart';

class post_details extends StatefulWidget {


  const post_details({Key? key}) : super(key: key);

  @override
  State<post_details> createState() => _post_detailsState();
}

class _post_detailsState extends State<post_details> {
  int likeCount = 12;

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context,);
                },
                icon: Icon(Icons.arrow_back, size: 20),
              ),
              Text(
                '자세히 보기',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
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
                    'ㅇㄴㄹㄴㅁㅇㄹㄴㅇㄹㅇㄴ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
