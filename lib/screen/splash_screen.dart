import 'package:flutter/material.dart';
import 'Login_screen.dart';
import 'signup.dart';
import 'main_screen.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 198.0), // 상단 간격 조절
          Expanded(
            child: Center(
              child: SizedBox(
                child: Image.asset('assets/images/Logo1.png'),
              ),
              )
          ),
          SizedBox(height: 194.0), // 로고와 버튼 사이 간격 조절
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              width: 260,
              height: 40,
              child: TextButton(
                onPressed: () {
                  // 로그인 버튼 클릭 시 다음 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NotoSansKR', // 폰트 변경
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: Color(0xFF2A59FF),
                  padding: EdgeInsets.symmetric(horizontal: 50.0), // 패딩 추가
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0), // 버튼 간격 조절
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              width: 260,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NotoSansKR', // 폰트 변경
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: Color(0xFF26A8BFD),
                  padding: EdgeInsets.symmetric(horizontal: 50.0), // 패딩 추가
                ),
              ),
            ),
          ),
          SizedBox(height: 48.0), // 하단 간격 조절
        ],
      ),
    );
  }
}
