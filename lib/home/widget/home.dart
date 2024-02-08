import 'package:flutter/material.dart';
import 'package:tteonatteona/question/widget/question_screen.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int itemCountToShow = 3;

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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ChatList(),
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
          SizedBox(height: 9),
          Container(
            width: 371,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 85.0),
                child: Image.asset('assets/images/location.png'),
              ),
            ),
          ),
          SizedBox(height: 23),
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
            ),
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
                );
              },
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
    );
  }
}

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int itemCountToShow = 3;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      itemCount: itemCountToShow,
      separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
      itemBuilder: (context, index) {
        return ChatItem(
          Lank: '1',
          TravelName: '일본 오사카',
          Like: '1,456',
        );
      },
    );
  }

  void showMoreItems() {
    setState(() {
      itemCountToShow = 15;
    });
  }
}


class ChatItem extends StatelessWidget {

  final String Lank;
  final String TravelName;
  final String Like;

  ChatItem({required this.TravelName, required this.Like, required this.Lank});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 371,
      height: 76,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Lank,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            TravelName,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 5),
          Text(
            Like,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
