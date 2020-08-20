import 'package:flutter/material.dart';
import 'dart:async';

// 获取使用动作的值
enum Action{
  Ok,Cancel
}
// 提示对话框
class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  // 默认是Nothing
  String _choice = 'Nothing';

  Future _openAlertDialog() async{
    // 打开一个对话框
    final action = await showDialog(
        context: context,
        // 必须要选择一个动作
        barrierDismissible: false,
        // 构建打开的对话框
        builder: (BuildContext context){
          // 对话框
          return AlertDialog(
            title: Text('AlertDialog'),
            // 对话框主要显示的文字
            content: Text('Are you sure about this?'),
            // 动作
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: (){
                  Navigator.pop(context, Action.Cancel);
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  Navigator.pop(context, Action.Ok);
                },
              ),
            ],
          );
        }
    );
    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Canael';
        });
        break;
      default:
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is: $_choice'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
