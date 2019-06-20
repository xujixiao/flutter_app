import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'TabFragment1.dart';
import 'TestNetDataListView.dart';

class MyTabTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyTab();
  }
}

class MyTab extends StatefulWidget {
  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "测试 tab",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("顶部tab切换"),
          bottom: new TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.star),
                text: "单车",
              ),
              Tab(
                icon: Icon(Icons.update),
                text: "助力车",
              ),
              Tab(
                icon: Icon(Icons.print),
                text: "出租车",
              )
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(controller: tabController, children: <Widget>[
          Center(
            child: TabFragment1(),
          ),
          Center(
            child: TestNetDataListView(),
          ),
          Center(
            child: Text("阿里巴巴"),
          ),
        ]),
      ),
    );
  }
}
