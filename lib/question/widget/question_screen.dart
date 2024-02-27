import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import 'dart:convert';
import 'package:tteonatteona/question/model/question.dart';
import 'package:tteonatteona/suggestion/suggestion_explain.dart';

class question extends StatelessWidget {
  const question({Key? key}) : super(key: key);


  Future<List<QuestionList>> getQuestionList() async {
    Dio dio = Dio();
    List<QuestionList> questionList = [];

    try {
      final resp = await dio.get(
        "$baseUrl/question",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      if (resp.statusCode == 200) {
        resp.data.forEach((item) {
          questionList.add(QuestionList.fromJson(item));
        });
        print('질문 목록 조회 성공');
      } else {
        print('질문 목록 조회 실패. 상태 코드: ${resp.statusCode}');
      }
    } catch (e) {
      print('에러: $e');
      throw Exception(e);
    }

    return questionList;
  }



  Future<void> question_answer(String questionId, String questionAnswer) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "questionId" : questionId,
      "questionAnswer" : questionAnswer
    };

    try {
      final resp = await dio.post(
        "$baseUrl/question",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
        data: jsonEncode(data),
      );
      print(resp.statusCode);
      print(jsonEncode(data));
    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 20),
              ),
              Text(
                '질문',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Image.asset('assets/images/question.png'),
          SizedBox(height: 12),
          questionList(),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 371,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => suggestion_explain()),
                      );
                    },
                    child: Text('완료', style: TextStyle(
                      color: Colors.white
                    ),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Color(0xff3792FD)
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class questionList extends StatefulWidget {
  const questionList({Key? key}) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<questionList> {
  List<bool> buttonClickedList = List.generate(6, (index) => false);
  List<bool> buttonClickedList2 = List.generate(6, (index) => false);

  List<String> texts = [    '1. 바다를 좋아하나요?',    '2. 방구석 여행을 즐기나요?',    '3. 탐험을 좋아하나요?',    '4. 관광을 즐기나요?',    '5. 답사를 즐기나요?',    '6. 먹는것을 즐기나요?',  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20, right: 20),
        itemCount: 6,
        itemBuilder: (context, index) {
          final backgroundColor =
          index.isEven ? Color(0xff6386FF) : Color(0xffDEE8FC);
          final iconColor = index.isEven ? Colors.white : Colors.black;
          final text = texts[index];
          final buttonBackgroundColor =
          buttonClickedList[index] ? Colors.red : Colors.green;

          return Column(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(
                    color: Color(0xff6386FF),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          color: iconColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  buttonClickedList[index] =
                                  !buttonClickedList[index];
                                });
                              },
                              icon: Icon(Icons.panorama_fish_eye, size: 30),
                              color: buttonClickedList[index] ? Colors.white : Colors.black,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  buttonClickedList2[index] =
                                  !buttonClickedList2[index];
                                });
                              },
                              icon: Icon(Icons.close, size: 33),
                              color: buttonClickedList2[index] ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
