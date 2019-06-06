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
    return Scaffold(
      body: Center(
        child: Text('xujixiao2'),
      ),
    );
  }
}
