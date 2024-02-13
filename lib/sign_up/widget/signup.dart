import 'package:flutter/material.dart';
import 'signup_complete_screen.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  final String name;

  const SignupScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool signupfailed = false;
  bool passwordMatchError = false;

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    pwdController.dispose();
    pwdConfirmController.dispose();
    super.dispose();
  }

  Future<void> postSignup(
      String id, String pwd, String name) async {
    Dio dio = Dio();

    dio.options.connectTimeout = Duration(seconds: 10);

    Map<String, dynamic> data = {
      "accountId": id,
      "password": pwd,
      "name": name,
    };
    try {
      final response = await dio.post(
        "$baseUrl/users/signup",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: jsonEncode(data),
      );
      print(response.statusCode);
      if (response.statusCode != 201) {
        throw Exception();
      }
      print(response.statusCode);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => complete()),
      );
    } catch (e) {
      setState(() {
        signupfailed = true;
      });
      throw Exception('Failed to post login info: $e');
    }
  }

  Future<bool> checkDuplicateId(String accountId, String accessToken) async {
    Dio dio = Dio();

    dio.options.connectTimeout = Duration(seconds: 10);

    try {
      final response = await dio.get(
        "$baseUrl/users/$accountId",
        options: Options(
          headers: {
            "Authorization": "Bearer $accessToken",
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Failed to check duplicate id: $e');
      throw Exception('Failed to check duplicate id: $e');
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
          SizedBox(height: 31),
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
          SizedBox(height: 15),
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
              controller: pwdConfirmController,
              obscureText: true,
              style: TextStyle(
                fontSize: 12,
              ),
              onChanged: (value) {
                setState(() {
                  passwordMatchError = pwdController.text != value;
                });
              },
              decoration: InputDecoration(
                hintText: "숫자, 영문, 특수문자 필수(최대 20자)",
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
                errorText: passwordMatchError ? "비밀번호가 일치하지 않습니다." : null,
                errorStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: "Noto Sans KR",
                  color: Color(0xffED6060),
                ),
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              ),
            ),
          ),
          SizedBox(height: 125),
          Container(
            width: 337,
            height: 40,
            child: TextButton(
              onPressed: () async {
                if (nameController.text.isEmpty ||
                    idController.text.isEmpty ||
                    pwdController.text.isEmpty ||
                    pwdConfirmController.text.isEmpty ||
                    pwdController.text != pwdConfirmController.text) {
                  setState(() {
                    passwordMatchError = true;
                  });
                } else {
                  try {
                    await postSignup(idController.text, pwdController.text, nameController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => complete()),
                    );
                  } catch (e) {
                    setState(() {
                      signupfailed = true;
                    });
                    print('Failed to signup: $e');
                  }
                }


              },
              child: Text(
                '회원가입',
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
