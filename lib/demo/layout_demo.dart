import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 横对齐主轴,平均分配空白空间
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // 交叉轴对其
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StackDemo(),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 设置子部件的宽高比
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 给子部件添加宽度高度
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 200.0, maxWidth: 200.0),
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 放小部件
    return Stack(
      // 小月亮顶部靠左对齐
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            // 子部件的位置
            alignment: Alignment(1.0, 1.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                // 圆角效果
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        // 间隔
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              // borderRadius: BorderRadius.circular(8.0)
              // 圆形
              shape: BoxShape.circle,
              // 径向渐变
              gradient: RadialGradient(colors: [
                Color.fromRGBO(7, 102, 255, 1.0),
                Color.fromRGBO(3, 54, 255, 1.0),
              ]),
            ),
            child: Icon(
              Icons.brightness_2,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
        // 具体位置
        Positioned(
          // 靠右20
          right: 20.0,
          top: 20.0,
          child: Icon(
            Icons.ac_unit,
            color: Colors.white,
            size: 32.0,
          ),
        )
      ],
    );
  }
}

// 图标徽章部件
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  // 构造方法
  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
