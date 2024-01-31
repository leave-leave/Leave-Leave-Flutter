import 'package:flutter/material.dart';
import 'package:tteonatteona/screen/feed.dart';
import 'package:tteonatteona/screen/home.dart';
import 'package:tteonatteona/screen/mypage.dart';
import 'package:tteonatteona/screen/suggestion.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _navIndex = [
    home(),
    mypage(),
    suggestion(),
    post(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navIndex.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
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
      ),
    );
  }
}