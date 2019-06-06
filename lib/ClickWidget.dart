import 'package:flutter/material.dart';

class ClickWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '点击事件测试',
      theme: ThemeData(primarySwatch: Colors.red),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() {
    return _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = " 我喜欢flutter";

  bool isShowWidget = false;

//  点击事件调用的方法，控制对变量的操作
  void _updateText() {
    setState(() {
      textToShow = "flutter 是很好学习的";
      isShowWidget = !isShowWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是个实例代码"),
      ),
      body: Center(
//        child: Text(textToShow),
        child: changeCenterView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'update text',
        child: Icon(Icons.update),
      ),
    );
  }

//  根据状态改变view的样式，根据变量的操作反应到view本身
  changeCenterView() {
    if (isShowWidget) {
      return Text('我是改变前的text');
    } else {
      return MaterialButton(
        onPressed: () {},
        child: Text('这个是materialbutton'),
      );
    }
  }
}
