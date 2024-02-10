import 'package:flutter/material.dart';

class TravelPlane extends StatefulWidget {
  const TravelPlane({Key? key}) : super(key: key);

  @override
  State<TravelPlane> createState() => _TravelPlaneState();
}

class _TravelPlaneState extends State<TravelPlane> {
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController textFieldController = TextEditingController();
  List<String> travelItems = [];

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

  void addItemToList() {
    String newItem = textFieldController.text.trim();
    if (newItem.isNotEmpty) {
      setState(() {
        travelItems.add(newItem);
        textFieldController.clear(); // 입력 필드 비우기
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        children: [
          SizedBox(height: 24),
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
          SizedBox(height: 15),
          Container(
            width: 353,
            height: 550,
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
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: '여행할 장소를 입력하세요',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      hintStyle: TextStyle(color: Color(0xffB0B7C3), fontSize: 14),
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
                      padding: EdgeInsets.only(left: 0),
                    onPressed: addItemToList,
                    icon: Icon(Icons.add),
                    color: Color(0xff3792FD),
                  ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 22),
                        width: 287,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffB8D1FE),
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
                )

              ],
            ),
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 298),
              child: Image.asset('assets/images/airplane.png'),
            ),
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 15),
          Container(
            width: 353,
            height: 40,
            child: TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
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
