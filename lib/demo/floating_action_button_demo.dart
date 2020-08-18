import 'package:flutter/material.dart';

// 漂浮动作按钮演示页面
class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    //点击后执行的动作
    onPressed: () {},
    child: Icon(Icons.add),
    // 控制跟下一层的高度，0.0就是没效果，贴合了。
    elevation: 0.0,
    backgroundColor: Colors.black87,
    // 按钮形状，默认圆形
    // shape: BeveledRectangleBorder(
    //   borderRadius: BorderRadius.circular(30.0),
    // ),
  );
  // 漂浮动作按钮,还可以添加标签文字
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('add'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      // 漂浮动作按钮,可以添加漂浮文字
      floatingActionButton: _floatingActionButton,
      // 调整漂浮按钮的位置，位置居中显示，会与底部工具栏叠合在一块
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部工具栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
        ),
        // 漂浮按钮的缺口
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
