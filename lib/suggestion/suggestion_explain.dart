import 'package:flutter/material.dart';
import 'package:tteonatteona/travelplane/widget/travelplane.dart';

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
            height: 420,
            padding: EdgeInsets.all(16.0), // 내부 여백 설정
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "일본 오사카",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "일본 오사카는 일본의 경제와 문화 중심지로서 동쪽에는 도쿄, 서쪽에는 교토에 인접해 있습니다. 이 성은 오사카의 상징적인 유산 중 하나로, ㅇㄴ 미나미 지역과 유명한 덴덴타운과 신사이바시 쇼핑 거리도 함께 있습니다. 오사카는 또한 유니버설 스튜디오 재팬과 같은 인기있는 테마 파크도 자랑합니다. 이 외에도 오사카에는 역사적인 사원과 신사, 현대적인 상점가와 오사카만의 독특한 문화를 경험할 수 있는 장소들이 많이 있습니다. 이 도시는 그 풍부한 문화와 다양한 경험들로 많은 이들에게 인기 있는 여행지 중 하나입니다.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
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
