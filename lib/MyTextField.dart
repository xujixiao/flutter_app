import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: Center(
          child: TextField(
            onChanged: (String text) {
              print("改变的字符串：" + text);
            },
            onSubmitted: (String text) {
              print("输入的字符串是：" + text);
            },
            decoration: InputDecoration(hintText: '请输入文本'),
          ),
        ),
      ),
    );
  }
}
