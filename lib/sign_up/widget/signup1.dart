import 'package:flutter/material.dart';
import 'signup2.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 120),
          Center(
            child: Image.asset('assets/images/Signup.png'),
          ),
          SizedBox(height: 19),
          Row(
            children: [
              SizedBox(width: 358),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1',
                      style: TextStyle(
                        color: Color(0xFF2A59FF),
                        fontSize: 12,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '/2',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(
            height: 19,
          ),
          Row(
            children: [
              SizedBox(width: 35),
              Text(
                '이름',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            width: 349,
            height: 36,
            child: TextField(
              controller: nameController,
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "최소 1자 ~ 5자",
                hintStyle: TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: SignupScreen.fieldtextColor,
                ),
                filled: true,
                fillColor: SignupScreen.backgroundfieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 14),
          Row(
            children: [
              SizedBox(width: 35),
              Text(
                '전화번호',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            width: 349,
            height: 36,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneNumberController,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: "최소 11자 ~ 15자",
                      hintStyle: TextStyle(
                        fontFamily: "Noto Sans KR",
                        color: SignupScreen.fieldtextColor,
                      ),
                      filled: true,
                      fillColor: SignupScreen.backgroundfieldColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: SignupScreen.blueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Container(
                    width: 65,
                    height: 35,
                    child: Center(
                      child: Text(
                        '인증 번호',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Noto Sans KR",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 13),
          Row(
            children: [
              SizedBox(width: 35),
              Text(
                '인증번호',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Container(
            width: 349,
            height: 36,
            child: TextField(
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "4자리 입력",
                hintStyle: TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: SignupScreen.fieldtextColor,
                ),
                filled: true,
                fillColor: SignupScreen.backgroundfieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 225),
          Container(
            width: 337,
            height: 40,
            child: TextButton(
              onPressed: () async {
                String name = nameController.text;
                String phoneNumber = phoneNumberController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen2(
                      name: name,
                      phoneNumber: phoneNumber,
                    ),
                  ),
                );
              },
              child: Text(
                '다음',
                style: TextStyle(
                  color: SignupScreen.tteonatteonawhiteColor,
                  fontFamily: 'NotoSansKR',
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: SignupScreen.blueColor,
                padding: EdgeInsets.symmetric(horizontal: 50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
