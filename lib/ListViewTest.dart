import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listview测试',
      home: Scaffold(
        appBar: AppBar(
          title: Text('listview test page'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.star),
              title: Text('第一行'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('第一行'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('第一行'),
            )
          ],
        ),
      ),
    );
  }
}
