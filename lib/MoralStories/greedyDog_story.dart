import 'package:flutter/material.dart';

class GreedyDo extends StatefulWidget {
  @override
  State<GreedyDo> createState() => _GreedyDoState();
}

class _GreedyDoState extends State<GreedyDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFFEF7F0),
        elevation: 0,
        title: Center(
          child: Text(
            'Greedy Dog',
            style: TextStyle(color: Colors.black, fontFamily: "arlrdbd"),
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
