import 'package:flutter/material.dart';

class TextWidgetApp extends StatelessWidget {
  Widget buildImage() {
    // ...
    return new DecoratedBox(
      decoration: new BoxDecoration(
        color: Colors.red,
        image: new DecorationImage(
          image: new AssetImage('graphics/beizhanyong.png'),
          // ...
        ),
        shape: BoxShape.rectangle
        // ...
      ),
    );
    // ...
  }

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
        body: Center(child: buildImage()),
      ),
    );
  }
}
