import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuildDemo();
  }
}

// 按需求生成项目数量
class GridViewBuildDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // 项目数量
      itemCount: posts.length,
      // 构建视图用的方法
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    // 生成一组列表，index 项目的索引号
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 网格试图，在交叉轴显示得数量
    return GridView.extent(
      // 交叉轴显示的数量，只有gridview.count方法有
      // crossAxisCount: 3,
      //交叉轴最大的尺寸
      maxCrossAxisExtent: 150,
      // 边距
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // 水平方向滚动
      scrollDirection: Axis.horizontal,
      // 生成项目得数量100
      children: _buildTiles(100),
    );
  }
}

class PageViewBuildDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _pageItemBuilder(BuildContext context, int index) {
      return Stack(
        children: <Widget>[
          // box的尺寸占满所有可用空间
          SizedBox.expand(
            child: Image.network(
              posts[index].imageUrl,
              // 填充效果
              fit: BoxFit.cover,
            ),
          ),
          // 叠加显示文字
          Positioned(
              bottom: 8.0,
              left: 8.0,
              child: Column(
                // 对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    posts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // 作者
                  Text(posts[index].author),
                ],
              )),
        ],
      );
    }

    // 页面视图
    return PageView.builder(
      // 列表项目得数量
      itemCount: posts.length,
      // 返回页面项目的小部件
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 页面可以滚动到任意位置上
      // pageSnapping: false,
      // 垂直滚动
      // scrollDirection: Axis.vertical,
      onPageChanged: (currentPAge) => debugPrint('page: $currentPAge'),
      // 控制小部件
      controller: PageController(
        // 初始显示的页面
        initialPage: 1,
        // 记录用户滚动到那个页面
        keepPage: false,
        // 占用可视窗口比例
        viewportFraction: 0.85,
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          //子部件的对齐
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[100],
          //子部件的对齐
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          //子部件的对齐
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
