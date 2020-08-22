import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//// 不包含那可以变化的那个状态，state指的就是状态，StatelessWidget一旦被创建后，里面的数据一般没什么变化
//class StateManagementDemo extends StatelessWidget {
//  // 继承的是StatelessWidget不能有变化的类，类里面的值不能有变化
//  int count = 0;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('StateManagementDemo'),
//        elevation: 0.0,
//      ),
//      body: Center(
//        child: Chip(
//          label: Text('$count'),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: (){
//          count += 1;
//          print(count);
//        },
//      ),
//    );
//  }
//}


// StatefulWidget构建的用户界面能够动态的发生变化， StatefulWidget本身不能被改变，小部件需要变化的状态需要放在state对象里面
// StatefulWidget里面的状态一旦发生了变化需要用setstate方法里面
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount(){
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
  //      body: CounterWrapper(_count, _increaseCount),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}


// StateManagementDemo会把数据传给CounterWrapper，CounterWrapper再把数据传给需要的Counter
class CounterWrapper extends StatelessWidget {
//  final int count;
//  final VoidCallback increaseCount;

//  CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
//  child: Counter(count, increaseCount),
    child: Counter(),
    );
  }
}


class Counter extends StatelessWidget {
  // 小部件需要的数据（state)从父辈传过来
// final int count;
 // 从父辈那传递过来回调
// final VoidCallback increaseCount;

 // 通过构造函数从父辈传过来的
// Counter(this.count, this.increaseCount);

 // 在这个类设置的count的值是不会有变化的，因为是StateManagementDemo的值
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      );
  }
}

//直接把数据传给需要的小部件，直接从StateManagementDemo传给counter
class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }): super(child: child);// 执行super的构造函数

  // 得到小部件的count和increaseCount
  static CounterProvider of(BuildContext context) =>
  // 在其他小部件使用这个这个小部件的of方法得到state
      context.inheritFromWidgetOfExactType(CounterProvider);

  //
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
