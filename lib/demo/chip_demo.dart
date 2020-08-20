import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_widget'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                SizedBox(width: 8.0),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghao'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text('浩'),
                    ),
                ),
                Chip(
                  label: Text('Wanghao'),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage('https://resources.ninghao.org/images/gravity-falls.png'),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
