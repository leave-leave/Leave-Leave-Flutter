import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Align(
            child: Image.asset('assets/images/tteonatteonabar.png'),
          ),
          Align(
            child: Image.asset('assets/images/main.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '요즘 인기 여행지',
                    style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w500,
                      height: 0
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('더보기',
                  style: TextStyle(
                    color: Color(0xFF474747),
                    fontSize: 14,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '설문 결과를 통해 여행지를 추천해 드려요',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Noto sans KR',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
