import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DemoApp(),
    routes: <String, WidgetBuilder>{'/a': (BuildContext context) => DemoApp2()},
  ));
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/a');
          },
          child: Text('这个调整的按钮'),
        ),
      ),
    );
  }
}

class DemoApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scollable layout',
      home: Scaffold(
        appBar: AppBar(
            title: Text('scrollable layout'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              AlertDialog(
                title: Text('对话框的标题'),
                contentPadding: EdgeInsets.all(20.0),
                content: Text('我是对话框的内容'),
                contentTextStyle: TextStyle(fontSize: 20,color: Colors.red),
              )
            ],
          ),
        ),


      ),
    );
  }
}
