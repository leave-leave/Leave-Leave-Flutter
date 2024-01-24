import 'package:flutter/material.dart';

class complete extends StatelessWidget {
  const complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
