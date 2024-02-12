import 'package:flutter/material.dart';
import 'package:tteonatteona/main/widget/main_screen.dart';

class complete extends StatelessWidget {
  const complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/signupcomplete.png'),
          )
        ],
      ),
    );
  }
}
