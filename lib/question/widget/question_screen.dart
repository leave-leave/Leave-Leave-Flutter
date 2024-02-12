import 'package:flutter/material.dart';

class question extends StatelessWidget {
  const question({Key? key}) : super(key: key);

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
          questionlist(),
          SizedBox(height: 27),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 371,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('완료'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
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


class questionlist extends StatelessWidget {
  const questionlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> texts = [
      '1. 바다를 좋아하나요?',
      '2. 방구석 여행을 즐기나요?',
      '3. 탐험을 좋아하나요?',
      '4. 관광을 즐기나요?',
      '5. 답사를 즐기나요?',
      '6. 먹는것을 즐기나요?',
    ];

    return Container(
      child: ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 20, right: 20),
      itemCount: 6,
      itemBuilder: (context, index) {
        final backgroundColor = index.isEven ? Color(0xff6386FF) : Colors.white;
        final iconColor = index.isEven ? Colors.white : Colors.black;
        final text = texts[index];
        return Column(
          children: [
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 13.7),
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
                    Padding(padding: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.panorama_fish_eye, size: 30),
                            color: backgroundColor == Colors.white ? Color(0xff505050) : Colors.white,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close, size: 33),
                            color: backgroundColor == Colors.white ? Color(0xff505050) : Colors.white,
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
