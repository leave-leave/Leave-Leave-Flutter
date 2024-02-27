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
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool signupfailed = false;
  bool passwordMatchError = false;

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    phoneNumberController.dispose();
    pwdController.dispose();
    pwdConfirmController.dispose();
    super.dispose();
  }

  Future<void> postSignup(BuildContext context, String name, String phoneNumber, String id, String pwd) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "accountId": id,
      "password": pwd,
      "name": name,
      "phoneNumber": phoneNumber,
    };
    try {
      final response = await dio.post(
        "$baseUrl/users/signup",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: data,
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to sign up: ${response.statusCode}');
      }

      final responseData = jsonDecode(response.data);

      print(response);
      print(responseData);

      final accessToken = responseData['access_token'];
      if (accessToken == null) {
        throw Exception('Failed to sign up: access token is null');
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Complete()),
      );
    } catch (e) {
      setState(() {
        signupfailed = true;
      });
      throw Exception('Failed to post login info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 100),
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
            child: TextField(
              controller: phoneNumberController,
              style: TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "11자 ~ 12자",
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
          SizedBox(height: 170),
          BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Container(
                width: 341,
                height: 40,
                child: TextButton(
                  onPressed: () async {
                    try {
                      await postSignup(
                        context,
                        nameController.text,
                        phoneNumberController.text,
                        idController.text,
                        pwdController.text,
                      );
                    } catch (e) {
                      print('Failed to sign up: $e');
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
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    backgroundColor: SignupScreen.blueColor,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
