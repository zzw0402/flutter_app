import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void onTapHandler(int index) {
    // 该方法只有statefulWidget才有
    setState(() {
      // 用户按的导航索引值
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // 菜单项的激活状态，为0就是第一个选项栏
      currentIndex: _currentIndex,
      // 切换激活状态,值是回调
      onTap: onTapHandler,
      // 导航栏的类型，默认的
      type: BottomNavigationBarType.fixed,
      // 激活状态下的颜色
      fixedColor: Colors.black,
      // 导航项目
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text('Explore')),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text('History')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My')),
      ],
    );
  }
}
