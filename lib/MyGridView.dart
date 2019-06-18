import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
/// gridview的用法
class MyGridView extends StatelessWidget {
  ListTile getDefaultTile() {
    return ListTile(
      onTap: () {
        print("点击了gridview");
      },
      title: Text(
        '中国',
        style: TextStyle(
            fontSize: 20, color: Colors.blue, backgroundColor: Colors.yellow),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试 gridview',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('gridview测试'),
        ),
        body: GridView.count(
          reverse: true,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 3,
          children: <Widget>[
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            ListTile(
              title: Text('中国'),
            ),
            getDefaultTile(),
            getDefaultTile(),
            getDefaultTile(),
          ],
        ),
      ),
    );
  }
}
