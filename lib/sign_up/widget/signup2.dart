import 'package:flutter/material.dart';
import 'signup_complete_screen.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import 'dart:convert';

class SignupScreen2 extends StatefulWidget {
  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  const SignupScreen2({Key? key}) : super(key: key);

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {

  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdCheckController = TextEditingController();

  bool signupfailed = false;


  @override
  void dispose() {
    idController.dispose();
    pwdController.dispose();
    pwdCheckController.dispose();
    super.dispose();
  }



  Future<void> postSignup2(String id, String pwd, String pwdCheck) async{
    Dio dio = Dio();

    dio.options.connectTimeout = Duration(seconds: 10);

    Map<String, dynamic> data = {
      "id": id,
      "pwd": pwd,
      "pwdCheck" : pwdCheck,
    };

    try {
      final response = await dio.post(
        "$baseUrl/users/signup",
          data: {
            "id": idController.text,
            "pwd": pwdController.text,
            "pwdCheck" : pwdCheckController.text,
          }
      );
      if (response.statusCode == 200) {
        print('success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => complete()),
        );
      }
    } catch (e) {
      setState(() {
        signupfailed = true;
      });
      print('fail');
    }


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
                      text: '2',
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
          SizedBox(height: 19),
          Row(
            children: [
              SizedBox(width: 35),
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
          SizedBox(height: 4),
          Container(
            width: 349,
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: idController,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: "영문과 숫자 필수(8자 ~ 15자)",
                      hintStyle: TextStyle(
                        fontFamily: "Noto Sans KR",
                        color: SignupScreen2.fieldtextColor,
                      ),
                      filled: true,
                      fillColor: SignupScreen2.backgroundfieldColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                TextButton(
                  onPressed: () {


                  },
                  style: TextButton.styleFrom(
                    backgroundColor: SignupScreen2.blueColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Container(
                    width: 65,
                    height: 35,
                    child: Center(
                      child: Text(
                        '중복 확인',
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

          SizedBox(height: 32),
          Row(
            children: [
              SizedBox(width: 35),
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
          SizedBox(height: 4),
          Container(
            width: 349,
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pwdController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: "숫자, 영문, 특수문자 필수(최대 20자)",
                      hintStyle: TextStyle(
                        fontFamily: "Noto Sans KR",
                        color: SignupScreen2.fieldtextColor,
                      ),
                      filled: true,
                      fillColor: SignupScreen2.backgroundfieldColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 19),
          Row(
            children: [
              SizedBox(width: 35),
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
          SizedBox(height: 4),
          Container(
            width: 349,
            height: 35,
            child: TextField(
              controller: pwdCheckController,
              obscureText: true,
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "숫자, 영문, 특수문자 필수(최대 20자)",
                hintStyle: TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: SignupScreen2.fieldtextColor,
                ),
                filled: true,
                fillColor: SignupScreen2.backgroundfieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Visibility(
            visible: signupfailed,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0, right: 130),
              child: Text(
                '아이디 또는 비밀번호가 일치하지 않습니다.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 11,
                ),
              ),
            ),
          ),
          SizedBox(height: 198),
          Container(
            width: 337,
            height: 40,
            child: TextButton(
              onPressed: () async{
                  await postSignup2(idController.text, pwdController.text, pwdCheckController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => complete()),
                  );
                },
              child: Text(
                '회원가입',
                style: TextStyle(
                  color: SignupScreen2.tteonatteonawhiteColor,
                  fontFamily: 'NotoSansKR',
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: SignupScreen2.blueColor,
                padding: EdgeInsets.symmetric(horizontal: 50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
