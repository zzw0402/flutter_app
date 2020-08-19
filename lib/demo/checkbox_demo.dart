import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value){
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text('Checkbox A'),
              // 子标题
              subtitle: Text('Description'),
              // 小图标
              secondary: Icon(Icons.bookmark),
              // 是否使用激活状态下的颜色
              selected: _checkboxItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Checkbox(
//                  // null就是禁用状态
//                  value: _checkboxItemA,
//                    onChanged:(value){
//                    setState(() {
//                      _checkboxItemA = value;
//                    });
//                    },
//                  //勾选状态下的颜色
//                  activeColor: Colors.black,
//                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
