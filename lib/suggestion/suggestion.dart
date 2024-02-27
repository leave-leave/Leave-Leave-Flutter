import 'package:flutter/material.dart';
import 'package:tteonatteona/suggestion/suggestion_explain.dart';

class suggestion extends StatefulWidget {
  const suggestion({Key? key}) : super(key: key);

  @override
  State<suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<suggestion> {

  final List<String> travelDestinations = [
    '일본 오사카',
    '프랑스 파리',
    '이탈리아 로마',
    '태국 방콕',
    '포르투갈 리스본',
    '체코 프라하',
    '칠레 산티아고',
    '이집트 카이로',
    '스위스 베른',
    '베트남 호이안',
    '스페인 바르셀로나',
    '노르웨이 오슬로',
    '네덜란드 암스테르담'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 6),
            Align(
              child: Image.asset('assets/images/tteonatteonabar2.png'),
            ),
            SizedBox(height: 30),
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
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                itemCount: travelDestinations.length,
                itemBuilder: (context, index) {
                  return CustomListItem(
                    index: index,
                    travelDestination: travelDestinations[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final int index;
  final String travelDestination;

  const CustomListItem({
    Key? key,
    required this.index,
    required this.travelDestination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 371,
      height: 70,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.only(left: 15),
          child: Image.asset('assets/images/listimg.png'),
        ),
        title: Text(
          travelDestination,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Noto Sans KR',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: '1,456',
            style: TextStyle(
              color: Color(0xff2A59FF),
              fontWeight: FontWeight.w500,
              fontFamily: "Noto Sans KR",
              fontSize: 13,
            ),
            children: [
              TextSpan(
                text: '명이 좋아요 누른 여행지',
                style: TextStyle(
                  color: Color(0xff474747),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Noto sans KR",
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(
                  fullscreenDialog: false,
                  builder: (context) => const suggestion_explain()));
        },
      ),
    );
  }
}
