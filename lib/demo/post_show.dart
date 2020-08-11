import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';
import '../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  const PostShow({Key key, this.post}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    // 括号内带大括号的是参数是可写可不写
//    PostShow({
//      @required this.post
//    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${post.title}', style: Theme.of(context).textTheme.title),
                Text('${post.author}', style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 32.0),
                Text('${post.description}', style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
