import 'package:flutter/material.dart';
import 'package:tteonatteona/travelplane/travelplane.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back, size: 20),
              ),
              Text(
                '마이 페이지',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 16,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 38),
            width: 411,
            height: 115,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Image.asset('assets/images/profile.png'),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '서예린',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Noto Sans KR',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: PreferredSize(
              preferredSize: Size.fromHeight(40), // 조절할 높이 설정
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: '여행 계획',
                  ),
                  Tab(
                    text: '반응한 게시물',
                  ),
                ],
                labelColor: Color(0xff1B6BD2),
                unselectedLabelColor: Color(0xff9F9F9F),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Noto Sans Kr',
                ),
                indicatorWeight: 3,
                indicatorColor: Color(0xff1B6BD2),
                indicatorSize: TabBarIndicatorSize.label,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildTravelPlanWidget(),
                buildReactedPostsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTravelPlanWidget() {
    return Column(
      children: [
        SizedBox(height: 17),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(left: 24),
            width: 200,
            height: 35,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => travelplane(),));
              },
              child: Text(
                '계획 작성하기',
                style: TextStyle(
                  fontSize: 14,
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
        ),
      ],
    );
  }

  Widget buildReactedPostsWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text('반응한 게시물 화면'),
    );
  }
}
