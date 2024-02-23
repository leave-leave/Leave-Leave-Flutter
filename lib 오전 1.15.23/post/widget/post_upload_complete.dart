import 'package:flutter/material.dart';
import 'package:tteonatteona/post/widget/post.dart';

class post_upload_complete extends StatelessWidget {

  const post_upload_complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Post()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/post_uploade.png'),
          )
        ],
      ),
    );
  }
}
