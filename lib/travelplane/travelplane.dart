import 'package:flutter/material.dart';

class travelplane extends StatefulWidget {
  const travelplane({Key? key}) : super(key: key);

  @override
  State<travelplane> createState() => _travelplaneState();
}

class _travelplaneState extends State<travelplane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF3FF),
      body: Column(
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
