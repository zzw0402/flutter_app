import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // // 抽屉头部，并且大写
          // DrawerHeader(
          //   child: Text('header '.toUpperCase()),
          //   // 抽屉头部背景色
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //   ),
          // ),
          // // 显示用户相关信息
          // // 使用了ListTitle自动生成抽屉
          // // 在左边添加一个iconbutton按钮
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   // 说明一下按钮的作用
          //   tooltip: 'Navigration',
          //   // 行为，输出hello world
          //   onPressed: () => debugPrint('Navigration button is presed'),
          // ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     // 说明一下按钮的作用
          //     tooltip: 'search',
          //     // 行为，输出hello world
          //     onPressed: () => debugPrint('Search button is presed'),
          //   ),
          // ],
          UserAccountsDrawerHeader(
            accountName:
                Text('ninhao', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('ninhao@qq.com'),
            // 当前账户的图像
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://resources.ninghao.org/images/candy-shop.jpg'),
            ),
            // 背景图片
            decoration: BoxDecoration(
              // 背景颜色
              color: Colors.yellow[400],
              // 图像
              image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                // 图像填充，填满整个区域
                fit: BoxFit.cover,
                // 图像颜色的滤镜
                colorFilter: ColorFilter.mode(
                    //颜色
                    Colors.yellow[400].withOpacity(0.6),
                    // 混合模式
                    BlendMode.hardLight),
              ),
            ),
          ),
          ListTile(
              title: Text(
                'message',
                textAlign: TextAlign.right,
              ),
              // 标题后添加图标，左边用leading
              trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
              // 点击关闭抽屉
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text(
                'Favorite',
                textAlign: TextAlign.right,
              ),
              trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text(
                'Settings',
                textAlign: TextAlign.right,
              ),
              trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
