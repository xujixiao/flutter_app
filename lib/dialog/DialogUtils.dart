import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
///自定义对话框
class DialogUtils {
  static Future<void> neverSatisfied(BuildContext context, String title,
      String content, String confirmText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(confirmText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
