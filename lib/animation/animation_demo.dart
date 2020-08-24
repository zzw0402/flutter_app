import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimationDemo'),
          elevation: 0.0,
        ),
        body: AnimationDemoHome());
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  //动画控制
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      // value: 32.0
      // 初始的值和最后的值，显示的值会是32-100的值,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      // 控制动画持续的时间 1秒钟
      duration: Duration(milliseconds: 1000),
      // 防止屏幕消耗不必要的资源,this就是当前对象
      vsync: this,
    );

    // 曲线
    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);

    // 动画需要的范围值，动画红色逐渐变成大红色，
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    //监听控制器控制的动画，输出每一帧动画输出的值
    // animationDemoController.addListener(() {
    //   // print('${animationDemoController.value}');
    //   setState(() {});
    // });


    // 监听动画运行的状态，并输出
    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });


    // 开始播放动画
    // animationDemoController.forward();
  }

  // 扔掉不太需要的动画
  @override
  void dispose() {
    super.dispose();

    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor,
        ],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        // 如果这种状态是完成的就倒退播放动画
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
