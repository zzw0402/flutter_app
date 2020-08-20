import 'package:flutter/material.dart';

// 收缩面板的类
class ExpansionPanelItem{
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

//收缩面板
class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  // 列表数据
  List<ExpansionPanelItem> _expansionPanelItems;
  @override
  // 初始数据
  void initState() {
    super.initState();

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content for Panel A.'),
          ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
        ),
        isExpanded: false,
      ),
    ];
  }
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
            // 收缩面板
            ExpansionPanelList(
              // 点按钮，被点的索引号，被按的状态
              expansionCallback: (int panelIndex, bool isExpanded){
                _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
              },
                // 迭代的处理列表的项目
              children: _expansionPanelItems.map(
                (ExpansionPanelItem item){
                  return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder: (BuildContext context, bool isExpanded){
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item.headerText, style: Theme.of(context).textTheme.title),
                      );
                    },
                  );
                },
              ).toList()
//              children:[
                // 面板
//                ExpansionPanel(
//                   头部，主体，状态
//                  headerBuilder: (BuildContext context, bool isExpanded){
//                    return Container(
//                      padding: EdgeInsets.all(16.0),
//                      child: Text('Panel A', style: Theme.of(context).textTheme.title),
//                    );
//                  },
//                  body: Container(
//                    padding: EdgeInsets.all(16.0),
//                    width: double.infinity,
//                    child: Text('Content for Panel A.'),
//                  ),
//                  // 收缩状态
//                  isExpanded: _isExpanded,
//                ),
//              ],
            ),
          ],
        ),
      ),
    );
  }
}
