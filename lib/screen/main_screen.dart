import 'package:flutter/material.dart';
import 'package:tteonatteona/screen/question_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var state = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: 0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '더보기',
                    style: TextStyle(
                      color: Color(0xFF474747),
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '현재 위치 날씨',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Noto sans KR',
              ),
            ),
          ),
        ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '설문 결과를 통해 여행지를 추천해 드려요',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Noto sans KR',
                ),
              ),
            )
          ),
          SizedBox(height: 7.32),
          Container(
            width: 371,
            height: 40,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => question()),
                );},
              child: Text(
                '질문 시작',
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Color(0xff3792FD),
        unselectedItemColor: Color(0xff616161),
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.feed),
            activeIcon: Icon(Icons.feed),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.thumb_up_off_alt),
            activeIcon: Icon(Icons.thumb_up_off_alt),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
