import 'package:flutter/material.dart';
import 'package:tteonatteona/travelplane/travelplane.dart';

class suggestion_explain extends StatefulWidget {
  const suggestion_explain({Key? key}) : super(key: key);

  @override
  State<suggestion_explain> createState() => _suggestion_explainState();
}

class _suggestion_explainState extends State<suggestion_explain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        children: [
          SizedBox(height: 30),
          Image.asset('assets/images/tteonatteonabar.png'),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '예린님, 이 여행지는 어때요?',
                style: TextStyle(
                  color: Color(0xff1E3999),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 23),
          Image.asset('assets/images/osaka.png'),
          SizedBox(height: 12),
          Container(
            width: 371,
            height: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 17),
          Container(
            width: 371,
            height: 40,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPlane()),
                );
              },
              child: Text(
                '여행 계획 세우기',
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontFamily: 'NotoSansKR',
                ),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Color(0xff3792FD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
