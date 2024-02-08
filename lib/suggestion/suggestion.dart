import 'package:flutter/material.dart';

class suggestion extends StatefulWidget {
  const suggestion({Key? key}) : super(key: key);

  @override
  State<suggestion> createState() => _suggestionState();
}

class _suggestionState extends State<suggestion> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        children: [
          SizedBox(height: 24),
          Align(
            child: Image.asset('assets/images/tteonatteonabar2.png'),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '예린님, 이 여행지는 어때요?',
                style: TextStyle(
                  color: Color(0xff1E3999),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
