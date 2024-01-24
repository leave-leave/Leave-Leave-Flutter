import 'package:flutter/material.dart';

class SignupScreen2 extends StatelessWidget {
  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  const SignupScreen2({Key? key}) : super(key: key);

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
          SizedBox(height: 55),
          Row(
            children: [
              SizedBox(width: 35), // 조절 가능한 왼쪽 여백
              Text(
                '아이디',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 4), // 라벨과 TextField 간의 간격 조절
          Container(
            width: 349,
            height: 36,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: "영문과 숫자 필수(8자 ~ 15자)",
                      hintStyle: TextStyle(
                        fontFamily: "Noto Sans KR",
                        color: fieldtextColor,
                      ),
                      filled: true,
                      fillColor: backgroundfieldColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4), // 조절 가능한 간격
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: 65,
                    height: 37,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '중복 확인',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Noto Sans KR",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 35), // 조절 가능한 왼쪽 여백
              Text(
                '비밀번호',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 4), // 라벨과 TextField 간의 간격 조절
          Container(
            width: 349,
            height: 36,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: "숫자, 영문, 특수문자 필수(최대 20자)",
                      hintStyle: TextStyle(
                        fontFamily: "Noto Sans KR",
                        color: fieldtextColor,
                      ),
                      filled: true,
                      fillColor: backgroundfieldColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4), // 조절 가능한 간격
              ],
            ),
          ),
          SizedBox(height: 13),
          Row(
            children: [
              SizedBox(width: 35), // 조절 가능한 왼쪽 여백
              Text(
                '비밀번호 재입력',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 4), // 라벨과 TextField 간의 간격 조절
          Container(
            width: 349,
            height: 36,
            child: TextField(
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "숫자, 영문, 특수문자 필수(최대 20자)",
                hintStyle: TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: fieldtextColor,
                ),
                filled: true,
                fillColor: backgroundfieldColor,
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
              onPressed: () {},
              child: Text(
                '회원가입',
                style: TextStyle(
                  color: tteonatteonawhiteColor,
                  fontFamily: 'NotoSansKR', // 폰트 변경
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: blueColor,
                padding: EdgeInsets.symmetric(horizontal: 50.0), // 패딩 추가
              ),
            ),
          ),
        ],
      ),
    );
  }
}
