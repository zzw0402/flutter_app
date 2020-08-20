import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon'
  ];

  List<String> _selected = [];
  String _action = 'Nothing';
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
            //超出屏幕会另起一行显示，本身可以设置间隔
            Wrap(
              // 小部件之间的间隔
              spacing: 8.0,
              // 行与行之间的间隔
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
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
                Chip(
                  label: Text('City'),
                  //按下删除按钮实现这个方法
                  onDeleted: (){},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  //长按小图标出现的提示
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                // 分隔符
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //缩进
                  indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  // map方法迭代处理_tags的项目，并转为list
                  children: _tags.map((tag){
                    return Chip(
                      label: Text(tag),
                      onDeleted: (){
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList()
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //缩进
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  // map方法迭代处理_tags的项目，并转为list
                  children: _tags.map((tag){
                    // filterChip有选中和未选中两种状态
                    return FilterChip(
                      label: Text(tag),
                      // 选中的状态，t or f, 如果_selected包含项目就是被选中的状态
                      selected: _selected.contains(tag),
                      onSelected: (value){
                        setState(() {
                          if(_selected.contains(tag)){
                            // 在选中的项目中去掉当前的项目
                            _selected.remove(tag);
                          }else{
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList()
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //缩进
                  indent: 32.0,
                ),
                Wrap(
                    spacing: 8.0,
                    // map方法迭代处理_tags的项目，并转为list
                    children: _tags.map((tag){
                      return Chip(
                        label: Text(tag),
                        onDeleted: (){
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      );
                    }).toList()
                ),
              ],
            ),
          ],
        ),
      ),
      // 重置功能
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
            // 点击按钮成为重置选择状态
            _selected = [];
          });
        },
      ),
    );
  }
}
