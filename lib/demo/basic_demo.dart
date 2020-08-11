import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.grey[100],
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://resources.ninghao.org/images/contained.jpg'),
              // 顶部中间显示
              alignment: Alignment.topCenter,
              // 重复不重复
              // repeat: ImageRepeat.repeatY
              // 填充模式，保此比例，覆盖整个容器显示
              fit: BoxFit.cover,
              // 滤镜
              colorFilter: ColorFilter.mode(
                // 滤镜颜色
                Colors.indigoAccent[400].withOpacity(0.5),
                // 混合模式
                BlendMode.hardLight,
              )),
        ),
        // container只有一个child
        child: Row(
          // 主轴对齐
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.poll, size: 32.0, color: Colors.white),
              // 背景颜色
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              // 容器内部填充
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              width: 90.0,
              height: 90.0,
              // 设置盒子装饰
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                // 边框
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                boxShadow: [
                  BoxShadow(
                      // 阴影的偏移，
                      offset: Offset(0.0, 0.0),
                      // 偏倚的颜色
                      color: Color.fromRGBO(16, 54, 255, 1.0),
                      // 模糊程度
                      blurRadius: 1.0,
                      // 扩散
                      spreadRadius: -9.0),
                ],
                // 圆形盒子
                shape: BoxShape.circle,
                // 径向渐变
                // gradient: RadialGradient(colors: [
                //   Color.fromRGBO(7, 102, 255, 1.0),
                //   Color.fromRGBO(3, 54, 255, 1.0),
                // ]),
                // 线性渐变
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 54, 255, 1.0),
                  ],
                  // 开始结束
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),

                // 圆角效果,全部设置为圆角
                // borderRadius: BorderRadius.circular(16.0),
              ),
            )
          ],
        ));
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 行内多样式
    return RichText(
      text: TextSpan(
        text: 'ninhao',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(fontSize: 16.0);

    final String _author = '李白';
    final String _title = '将进酒';
    return Text(
      // $引用变量
      '《$_author》——$_title君不见黄河之水天上来，奔流到海不复回，君不见高堂明镜恋白发，朝如青丝暮成雪',
      textAlign: TextAlign.left,
      // 下划线表示私有方法
      style: _textStyle,
      // 省略
      overflow: TextOverflow.ellipsis,
    );
  }
}
