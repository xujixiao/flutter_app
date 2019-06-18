import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/resource/Strings.dart';

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
//          children: _getListData(),
            children: ListTile.divideTiles(
                    context: context, tiles: _getListData(), color: Colors.blue)
                .toList()),
      ),
    );
  }

  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(new GestureDetector(
        child: new Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text('listview item ' + i.toString()),
            leading: Icon(Icons.update),
            trailing: Icon(Icons.star),
            isThreeLine: true,
            dense: true,
            subtitle: Text("副标题"),
            contentPadding: EdgeInsets.all(20),
            onTap: () {
              print("listview的单击事件");
            },
            onLongPress: () {
              print("listview 的longpresse事件");
            },
          ),
        ),
        onTap: () {
          print('roow tapdd');
        },
      ));
    }
    return widgets;
  }
}
