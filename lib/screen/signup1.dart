import 'package:flutter/material.dart';
import 'signup2.dart';

class SignupScreen extends StatelessWidget {
  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  const SignupScreen({Key? key}) : super(key: key);

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
                '이름',
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
                hintText: "최소 1자 ~ 5자",
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
          SizedBox(height: 14),
          Row(
            children: [
              SizedBox(width: 35), // 조절 가능한 왼쪽 여백
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
                      hintText: "최소 11자 ~ 15자",
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
                    width: 73,
                    height: 36,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '인증 번호',
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
          SizedBox(height: 13),
          Row(
            children: [
              SizedBox(width: 35), // 조절 가능한 왼쪽 여백
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
          SizedBox(height: 4), // 라벨과 TextField 간의 간격 조절
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
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen2()),
              );},
              child: Text(
                '다음',
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
