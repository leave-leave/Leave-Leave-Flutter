import 'package:flutter/material.dart';
import 'package:tteonatteona/mypage/widget/mypage.dart';
import 'package:tteonatteona/home/widget/home.dart';
import 'package:tteonatteona/post/widget/post.dart';
import 'package:tteonatteona/suggestion/suggestion.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _navIndex = [
    const Home(),
    const Post(),
    const suggestion(),
    const MyPage(title: '', traveldetail: [],),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navIndex[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: const Color(0xff3792FD),
          unselectedItemColor: const Color(0xff616161),
          items: [
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home_filled),
              activeIcon: Icon(Icons.home_filled),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.feed),
              activeIcon: Icon(Icons.feed),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.thumb_up_off_alt),
              activeIcon: Icon(Icons.thumb_up_off_alt),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}