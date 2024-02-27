import 'package:flutter/material.dart';
import 'package:tteonatteona/home/widget/home.dart';
import 'package:tteonatteona/main/widget/main_screen.dart';
import 'package:tteonatteona/secret.dart';
import 'dart:convert';
import 'package:dio/dio.dart';


class LoginScreen extends StatefulWidget {
  static const Color blueColor = Color(0xff2A59FF);
  static const Color backgroundfieldColor = Color(0xffeeeeee);
  static const Color fieldtextColor = Color(0xff9c9c9c);
  static const Color tteonatteonawhiteColor = Color(0xffffffff);

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool loginFailed = false;

  Future<void> postLoginInfo(String accountId, String password) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "accountId": accountId,
      "password": password,
    };

    try {
      final response = await dio.post(
        "$baseUrl/users/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: jsonEncode(data),
      );

      if (response.statusCode != 200) {
        throw Exception(response.data);
      }

      accessToken = response.data['access_token'];
      refreshToken = response.data['refresh_token'];
      print('Response data: ${response.data}');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );

    } catch (e) {
      setState(() {
        loginFailed = true;
      });
      throw Exception('Failed to post login info: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 113),
          Center(
            child: Image.asset('assets/images/Login.png'),
          ),
          const SizedBox(height: 75),
          Container(
            width: 337,
            height: 42,
            child: TextField(
              controller: idController,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "아이디",
                hintStyle: const TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: LoginScreen.fieldtextColor,
                ),
                filled: true,
                fillColor: LoginScreen.backgroundfieldColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Container(
            width: 337,
            height: 42,
            child: TextField(
              obscureText: true,
              controller: pwdController,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintText: "비밀번호",
                hintStyle: const TextStyle(
                  fontFamily: "Noto Sans KR",
                  color: LoginScreen.fieldtextColor,
                ),
                filled: true,
                fillColor: const Color(0xffeeeeee),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          Visibility(
            visible: loginFailed,
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
          SizedBox(height: 309),
          BottomSheet(
            onClosing: () {},
            builder: (BuildContext context) {
              return Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 337,
                  height: 40,
                  child: TextButton(
                    onPressed: () async {
                      await postLoginInfo(idController.text, pwdController.text);
                    },
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        color: LoginScreen.tteonatteonawhiteColor,
                        fontFamily: 'NotoSansKR',
                      ),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: LoginScreen.blueColor,
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    ),
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
