import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sliver可视口，放在cust中
      body: CustomScrollView(
        slivers: <Widget>[
          // 顶部
          SliverAppBar(
            // title: Text('ninhao'),
            // 一直显示在顶部
            // pinned: true,
            // 向下滚动顶部慢慢消失
            floating: true,
            // 伸展的高度，顶部高度
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                // toup大写
                'ninhao FLutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://resources.ninghao.org/images/contained.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 去除刘海屏
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      // 构建网格视图的项目
      delegate: SliverChildBuilderDelegate(
        // 需要一个buildContext方法
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
                // 圆角
                borderRadius: BorderRadius.circular(12.0),
                // 阴影
                elevation: 14.0,
                // 阴影颜色,with不透明度
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Stack(
                  // 特定的比例
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        posts[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        // 交叉轴对齐
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Text(
                            posts[index].title,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
        // 网格试视图的数量
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 视图，跟gridview差不多
    return SliverGrid(
      // 构建网格视图的相关东西
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 交叉轴上面的数量
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          // 控制网格视图的比例
          childAspectRatio: 1.6),
      // 构建网格视图的项目
      delegate: SliverChildBuilderDelegate(
        // 需要一个buildContext方法
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        // 网格试视图的数量
        childCount: posts.length,
      ),
    );
  }
}
