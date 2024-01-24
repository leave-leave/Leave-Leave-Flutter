import 'package:flutter/material.dart';

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
          SizedBox(height: 112),
          Center(
            child: Image.asset('assets/images/Signup.png'),
          ),
          SizedBox(height: 87),
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
            width: 300,
            height: 35,
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
          SizedBox(height: 13),
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
            width: 284.4,
            height: 102.4,
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
                    // 인증번호 버튼이 클릭되었을 때 수행할 작업 추가
                    print('인증번호 버튼 클릭');
                  },
                  child: Container(
                    width: 114.4,
                    height: 35,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
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
              ],
            ),
          ),
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
            width: 351.4,
            height: 102.4,
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
          SizedBox(height: 169,),
          Container(
            width: 300,
            height: 40,
            child: TextButton(
              onPressed: () {},
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
