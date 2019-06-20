import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class TestNetDataListView extends StatefulWidget {
  @override
  _TestNetDataListViewState createState() => _TestNetDataListViewState();
}

class _TestNetDataListViewState extends State<TestNetDataListView> {
  List widgets = [];

  /*加载异步的网络数据*/
  loadData() async {
    String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataUrl);
//    print(response.body);
    widgets = json.decode(response.body);
  }


  _getRow(int position) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        widgets[position]['title'],
        style: TextStyle(color: Colors.red),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return _getRow(position);
        });
  }
}
