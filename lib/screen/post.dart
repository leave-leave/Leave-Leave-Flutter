import 'package:flutter/material.dart';


class post extends StatefulWidget {
  const post({Key? key}) : super(key: key);

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
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
            onPressed: () {},
            icon: Icon(Icons.arrow_back, size: 20),
          ),
          Text(
            '게시물',
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
