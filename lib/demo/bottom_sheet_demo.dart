import 'package:flutter/material.dart';
import 'dart:async';

// 屏幕底部滑动出来的
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  // 引用对应的ScaffoldState，一般触发使用可以使用ScaffoldState的showBottomSheet方法
  final _bottomSheetScaffolKey = GlobalKey<ScaffoldState>();

  _openBottomSheet(){
    _bottomSheetScaffolKey
      .currentState
      .showBottomSheet((BuildContext context){
        // 创建在BottomSheet上显示的小部件
        return BottomAppBar(
          child: Container(
            height: 90.0,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.pause_circle_outline),
                SizedBox(width: 16.0),
                Text('01:30 / 03:30'),
                Expanded(
                  child: Text('Fix you - Coldplay', textAlign: TextAlign.right),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

 Future _openModelBottomSheet()async{
   final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: (){
                    Navigator.pop(context,'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: (){
                    Navigator.pop(context,'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: (){
                    Navigator.pop(context,'C');
                  },
                ),
              ],
            ),
          );
        }
    );
   print(option);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffolKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Open BottomSheet'),
                  onPressed: _openBottomSheet,
                ),
                // 对话框形式的
                FlatButton(
                  child: Text('Modal BottomSheet'),
                  // 获取对话框的值
                  onPressed: _openModelBottomSheet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
