import 'package:flutter/material.dart';
import 'package:flutter_app/demo/drawer_demo.dart';
import 'package:flutter_app/demo/bottom_navigation_bar_demo.dart';
import 'package:flutter_app/demo/form_demo.dart';
import 'package:flutter_app/demo/rxdart/rxdart_demo.dart';
import 'package:flutter_app/demo/state/state_management_demo.dart';
import './demo/listview_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';
import 'demo/stream/stream_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//         home: NavigatorDemo(),
      //路由名字 /表示初始路由，默认显示的
      initialRoute: '/rxdart',
      routes: {
        '/': (context) => NavigatorDemo(),
        '/about': (context) => Page1(title: 'about'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        'rxdart': (context) => RxDartDemo(),
      },
      theme: ThemeData(
          // 主题颜色
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          // 水波纹颜色
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0)),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 默认的标签控制器
    return DefaultTabController(
      // 标签数量
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text('helloworld'),
          // 顶部阴影
          elevation: 30.0,
          //tab 标签栏 tabview 标签视图 tabController 标签控制器
          bottom: TabBar(
            // 未被选择的颜色
            unselectedLabelColor: Colors.black38,
            // 选中状态下的那条横线
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
            ],
          ),
        ),
        // 页面主题
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo(),
          ],
        ),
        // 抽屉
        drawer: DrawerDemo(),
        // 底部导航栏
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
