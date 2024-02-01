import 'package:flutter/material.dart';
import 'package:tteonatteona/screen/post.dart';

class postadd extends StatelessWidget {
  const postadd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffECF3FF),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => post()),
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
          ]
      ),
    );
  }
}
