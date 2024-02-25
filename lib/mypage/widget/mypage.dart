import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tteonatteona/post/widget/post.dart';
import 'package:tteonatteona/travelplane/widget/travelplane.dart';
import 'package:tteonatteona/mypage/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:tteonatteona/secret.dart';

class MyPage extends StatefulWidget {
  final List<String> travelItems;
  final DateTime? startDate;
  final DateTime? endDate;

  const MyPage({Key? key, required this.travelItems,
    this.startDate,
    this.endDate,}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  bool hasPlans = true;
  bool hasReactedPosts = true;
  String? userName;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<String> get travelItems => widget.travelItems;

  Future userInfo() async{

    Dio dio = Dio();

    try{
      final response = await dio.get(
        '$baseUrl/users/user',
        options: Options(
          headers: {
            "Content-Type" : "application/json",
            "Authorization" : "Bearer $accessToken"
          },
        )
      );

      model _user = model.fromJson(response.data);
      setState(() {
        userName = _user.name;
      });

    }
    catch(e){
      print('e');
    }
  }

  Future<void> postLike(
      String feedId,
      String title,
      String content,
      ) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "feedId": feedId,
      "title": title,
      "content": content,
    };

    try {
      final resp = await dio.get(
        "$baseUrl/feeds/like",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
        data: jsonEncode(data),
      );
      print(resp.statusCode);
      print(jsonEncode(data));
    } catch (e) {
      print('에러');
      throw Exception(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    userInfo();
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(width: 30),
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
                      '$userName',
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
              preferredSize: Size.fromHeight(40),
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
                hasPlans ? buildTravelPlanWidget() : buildNoPlansWidget(),
                hasReactedPosts
                    ? buildReactedPostsWidget()
                    : buildNoReactedPostsWidget(),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TravelPlane()));
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
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildReactedPostsWidget() {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 20, right: 20),
      child: Center(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff3792FD),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 371,
                    height: 90,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          '2024년 3월 19일에 LCK 보고 싶어서 서울 여행을 계획해보자 '
                              '나는 잠실에 있는 시그니엘 호텔에서 잠을 자자 '
                              '비용은 n빵 하는 걸로 그리고...',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontFamily: "Noto Sans KR",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.1,
                    right: 20,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => const Post())
                        );
                      },
                      child: Text(
                        '자세히 보기',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3792FD),
                          fontFamily: "Noto Sans KR",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildNoPlansWidget() {
    return Center(
      child: Text(
        '여행 계획을 작성해 보실래요?',
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff83ACF9),
          fontWeight: FontWeight.w600,
          fontFamily: 'Noto Snas KR',
        ),
      ),
    );
  }

  Widget buildNoReactedPostsWidget() {
    return Center(
      child: Text(
        '반응한 게시물이 없습니다.',
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff83ACF9),
          fontWeight: FontWeight.w600,
          fontFamily: 'Noto Snas KR',
        ),
      ),
    );
  }
}
