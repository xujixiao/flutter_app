import 'package:flutter/material.dart';

class TextWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'this is textview test',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '测试',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Text(
            '测试textview',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
      ),
    );
  }
}
