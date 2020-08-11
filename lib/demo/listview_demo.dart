import 'package:flutter/material.dart';
import 'package:flutter_app/demo/post_show.dart';
import '../model/post.dart';
import './post_show.dart';

class ListViewDemo extends StatelessWidget {
  // index 列表项目索引值
  Widget _ListItemBuilder(BuildContext context, int index) {
    // 返回一widget，文字是posts,在访问下title属性的索引值
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // 来源网络所以用network方法，aspcct是调整图像比例
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(posts[index].title,
                  style: Theme.of(context).textTheme.title),
              Text(posts[index].author,
                  style: Theme.of(context).textTheme.subhead),
              // 小部件的高度
              SizedBox(height: 16.0),
            ],
          ),
          // 需要单独设置上下左右的位置
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              // 溅墨
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostShow(post: posts[index]))
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // 列表项目数量
      itemCount: posts.length,
      // 使用一个方法去构建列表视图的项目
      itemBuilder: _ListItemBuilder,
    );
  }
}
