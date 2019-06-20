import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TabFragment1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(text: "hellobike:"),
            TextSpan(
                text: "http:www.baidu.com", style: TextStyle(color: Colors.red))
          ])),
          OutlineButton(
            child: Text("outlinebutton"),
            onPressed: () {
              print("outlinebutton is pressed");
            },
          )
        ],
      ),
    );
  }
}
