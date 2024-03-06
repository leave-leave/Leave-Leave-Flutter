import 'package:flutter/material.dart';
import 'package:tteonatteona/mypage/widget/mypage.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';
import 'dart:convert';

class TravelPlane extends StatefulWidget {
  const TravelPlane({Key? key}) : super(key: key);

  @override
  State<TravelPlane> createState() => _TravelPlaneState();
}

class _TravelPlaneState extends State<TravelPlane> {

  late String title;
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController textFieldController = TextEditingController();
  List<String> traveldetail = [];

  bool isPlanCompleted = false;

  Future<void> plane_add(
      String userId,
      String title,
      String startDate,
      String endDate
      ) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "userId" : userId,
      "title": title,
      "startDate": startDate,
      "endDate": endDate,
    };

    try {
      final resp = await dio.post(
        "$baseUrl/plans",
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


  Future<void> plane_delete(String planId) async {
    Dio dio = Dio();

    try {
      final resp = await dio.delete(
        "$baseUrl/plans",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      print(resp.statusCode);

    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }


  Future<List> createTravelDetail(String planId,List<String> travelDetail) async {
    Dio dio = Dio();

    try {
      final resp = await dio.post(
        "$baseUrl/todo/$planId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
        data: jsonEncode({"travelDetail": travelDetail}),
      );
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        print('여행 세부 사항 생성 성공');
      } else {
        print('여행 세부 사항 생성 실패. 상태 코드: ${resp.statusCode}');
      }
    } catch (e) {
      print('에러: $e');
      throw Exception(e);
    }

    return travelDetail;
  }


  Future<void> traveldetaildelete(String todoId) async {
    Dio dio = Dio();

    try {
      final resp = await dio.delete(
        "$baseUrl/plans/$todoId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      print(resp.statusCode);

    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }


  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  void adddetailToList() {
    String newItem = textFieldController.text.trim();
    if (newItem.isNotEmpty) {
      setState(() {
        traveldetail.add(newItem);
        textFieldController.clear();
      });
    }
  }

  void removedetail(int index) {
    setState(() {
      traveldetail.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        children: [
          SizedBox(height: 21),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 20),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        '여행 계획을',
                        style: TextStyle(
                          fontFamily: "Noto Sans KR",
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        '완료하실래요?',
                        style: TextStyle(
                          fontFamily: "Noto Sans KR",
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 114),
                  child: Image.asset('assets/images/airplane.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: 353,
            height: 537,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xff53A8F7),
                width: 1,
              ),
            ),
            padding: EdgeInsets.only(left: 25, top: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '내가 여행할 장소',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto Sans KR',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.only(right: 25),
                  width: 340,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffB8D1FE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: '여행할 장소를 입력하세요',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      hintStyle: TextStyle(color: Color(0xffB0B7C3), fontSize: 14, height: -0.4),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '기간',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto Sans KR',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xffB8D1FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            startDate != null
                                ? '${startDate!.year}-${startDate!.month}-${startDate!.day}'
                                : '출발',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    Icon(Icons.horizontal_rule),
                    SizedBox(width: 7),
                    GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xffB8D1FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            endDate != null
                                ? '${endDate!.year}-${endDate!.month}-${endDate!.day}'
                                : '도착',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  '할 일',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Noto Sans KR',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: adddetailToList,
                      icon: Icon(Icons.add),
                      color: Color(0xff3792FD),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 22),
                        width: 287,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xffEBEBEB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: textFieldController,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: '할 일을 입력하세요',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            hintStyle: TextStyle(color: Color(0xffB0B7C3), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: traveldetail.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 54,
                        margin: EdgeInsets.only(left: 10, right: 27, bottom: 24),
                        decoration: BoxDecoration(
                          color: Color(0xffEBEBEB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 16, right: 10),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, size : 25, color: Color(0xff53A8F7)),
                            onPressed: () {
                              removedetail(index);
                            },
                          ),
                          title: Text(
                            traveldetail[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 57),
          Container(
            width: 353,
            height: 40,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isPlanCompleted = true;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPage(
                      title: title,
                      startDate: startDate,
                      endDate: endDate,
                      traveldetail : traveldetail
                    ),
                  ),);
              },
              child: Text(
                '계획 완료',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontFamily: 'NotoSansKR',
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Color(0xff3792FD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
