import 'package:flutter/material.dart';


//  routes 展示内容的屏幕或者页面，就是路由
//  navigator提供的方法去管理路由，push、pop
//  从最上面拿掉一个东西就是pop
// push就是新的东西到最上面
class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: null, child: Text('Home')),
            FlatButton(
                // 跳到指定路由的页面上
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('About')),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String title;

  Page1({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      // 返回按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
