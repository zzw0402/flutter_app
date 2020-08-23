import 'dart:async';
import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  //监听StreamSubscription
  StreamSubscription _streamDemoSubscription;
  // 控制管理stream
  StreamController<String> _streamDemo;
  //往StreamController控制的stream添加数据
  StreamSink _sinkDemo;
  String _data = '...';

  // 关闭，小部件移除的时候会执行此方法
  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  //初始化数据
  @override
  void initState() {
    super.initState();

    // 创建stream
    print('Create a stream.');
//     Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // 控制stream，broadcast可多次订阅
    _streamDemo = StreamController.broadcast();
    //返回的时sinkstream
    _sinkDemo = _streamDemo.sink;

    print('Start listening a stream.');
    //监听stream（或者叫添加了一个订阅）,当stream有数据时,发生错误时，完成时需完成的事情
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    // 第二个订阅
        _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  // 延迟5秒钟，出现的数据，输出hello
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // 异常信息
    // throw 'Something happened';
    return 'hello ~';
  }

  // 完成时
  void onDone() {
    print('Done!');
  }

  // 当stream有数据时做的事
  void onData(String data) {
    // add数据时，... = 输出的值，在界面上显示数据
    setState(() {
      _data = data;
    });
    print('$data');
  }

   //错误时
  void onError(error) {
    print('Error: $error');
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }


  // 停止订阅
  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }
  // 恢复订阅
  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

  //取消订阅
  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  // 添加数据
  void _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
    // _streamDemo.add(data);
    // 用sinkDmeo的add方法，添加的数据是执行fetchData返回的data
    _sinkDemo.add(data);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            //根据stream上的数据去构建小部件就不需要setstate方法了
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
