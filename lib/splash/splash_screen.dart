import 'package:flutter/material.dart';
import 'package:tteonatteona/login/widget/Login_screen.dart';
import 'package:tteonatteona/mypage/widget/mypage.dart';
import 'package:tteonatteona/post/widget/post.dart';
import 'package:tteonatteona/sign_up/widget/signup.dart';


class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 198.0),
          Expanded(
            child: Center(
              child: SizedBox(
                child: Image.asset('assets/images/Logo1.png'),
              ),
              )
          ),
          SizedBox(height: 194.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              width: 337,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: Color(0xFF2A59FF),
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              width: 337,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen(name: '',)),
                  );
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NotoSansKR',
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: Color(0xFF26A8BFD),
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 48.0),
        ],
      ),
    );
  }
}
