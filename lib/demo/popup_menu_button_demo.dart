import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 显示的文字
            Text(_currentMenuItem),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 弹出式菜单按钮
                PopupMenuButton(
                  // 选择菜单项的项目会执行弹出菜单里面的onselevted的回调
                  onSelected: (value) {
                    print(value);
                    // 选择的值设置被选择菜单项的值
                    setState(() {
                      _currentMenuItem = value;
                    });
                  },
                  // 菜单中的项目
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Home',
                      child: Text('Home'),
                    ),
                    PopupMenuItem(
                      value: 'Discover',
                      child: Text('Discover'),
                    ),
                    PopupMenuItem(
                      value: 'Community',
                      child: Text('Community'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
