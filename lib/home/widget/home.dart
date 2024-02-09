import 'package:flutter/material.dart';
import 'package:tteonatteona/question/widget/question_screen.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  bool showAllItems = false;

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
                  onPressed: () {
                    setState(() {
                      showAllItems = !showAllItems;
                    });
                  },
                  child: Text(
                    showAllItems ? '간단히' : '더보기',
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
          ChatList(showAllItems : showAllItems),
          SizedBox(height: 8),
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

  final bool showAllItems;

  const ChatList({Key? key, required this.showAllItems}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20, right: 20),
        itemCount: widget.showAllItems ? 15 : 3,
        itemBuilder: (context, index) {
          return ChatItem(
            Lank: (index + 1).toString(),
            TravelName: '일본 오사카',
            Like: '1,456',
          );
        },
      ),
    );
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
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        title: Row(
          children: [
            Text(
              this.Lank,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff2A59FF),
              ),
            ),
            SizedBox(width: 17),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/images/listimg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14),
                  SizedBox(width: 7),
                  Text(
                    this.TravelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Noto Sans KR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${this.Like}명이 좋아요 누른 여행지',
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
          ],
        ),
      ),
    );
  }
}
