import 'package:flutter/material.dart';
import 'package:tteonatteona/main/widget/main_screen.dart';
import 'login/model/login_model.dart';
import 'dart:convert';
import 'package:dio/dio.dart';



class LoginScreen extends StatelessWidget {

  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 113),
          Center(
            child: Image.asset('assets/images/Login.png'),
          ),

          SizedBox(height: 75),

          Container(
            width: 337,
            height: 42,
            child: TextField(
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "아이디",
                hintStyle: TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: fieldtextColor,
                ),
                filled: true,
                fillColor: backgroundfieldColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            width: 337,
            height: 42,
            child: TextField(
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "비밀번호",
                hintStyle: TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: fieldtextColor,
                ),
                filled: true,
                fillColor: Color(0xffeeeeee),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),

          SizedBox(height: 343),
          Container(
            width: 337,
            height: 40,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Text(
                '로그인',
                style: TextStyle(
                  color: tteonatteonawhiteColor,
                  fontFamily: 'NotoSansKR',
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: blueColor,
                padding: EdgeInsets.symmetric(horizontal: 50.0),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
