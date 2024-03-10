import 'package:flutter/material.dart';
import 'package:tteonatteona/question/widget/question_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showAllItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              ChatList(showAllItems: showAllItems),
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
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Image.asset(
                        'assets/images/location.png',)
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        SizedBox(height: 48),
                        Text(
                          '대전광역시 유성구 가정북로 76',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '현재 온도 : 0도',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: Color(0xff3792FD),
                  ),
                ),
              ),
            ],
          ),
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
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 20, right: 20),
        itemCount: widget.showAllItems ? 15 : 3, // 여기서 여행지 개수 조절
        itemBuilder: (context, index) {
          if (index == 0) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '일본 오사카',
              like: '3,456',
            );
          } else if (index == 1) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '3,234',
            );
          }
          else if (index == 2) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '이탈리아 로마',
              like: '2,624',
            );
          }
          else if (index == 3) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '태국 방콕',
              like: '2,239',
            );
          }
          else if (index == 4) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '호주 시드니',
              like: '2,134',
            );
          }
          else if (index == 5) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '체코 프라하',
              like: '1,998',
            );
          }
          else if (index == 6) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '폴란드 크라쿠프',
              like: '1,234',
            );
          }
          else if (index == 7) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '남아프리카 케이프타운',
              like: '1,234',
            );
          }
          else if (index == 8) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '브라질 리우데자네이루',
              like: '1,234',
            );
          }
          else if (index == 9) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '1,234',
            );
          }
          else if (index == 10) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '1,234',
            );
          }
          else if (index == 11) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '1,234',
            );
          }
          else if (index == 12) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '1,234',
            );
          }
          else if (index == 13) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '1,234',
            );
          }
          else if (index == 14) {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '프랑스 파리',
              like: '1,234',
            );
          }
          else {
            return ChatItem(
              lank: (index + 1).toString(),
              travelName: '미국 뉴욕',
              like: '1,000',
            );
          }
        },
      ),
    );
  }
}


class ChatItem extends StatelessWidget {
  final String lank;
  final String travelName;
  final String like;

  ChatItem({required this.travelName, required this.like, required this.lank});

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
        title: Row(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 12),
              child:Text(
                  this.lank,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff2A59FF),
                  ),
              ),
            ),
            SizedBox(width: 17),
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(bottom: 15),
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
                  SizedBox(height: 9),
                  Text(
                    this.travelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Noto Sans KR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${this.like}명이 좋아요 누른 여행지',
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
