import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/post.dart';

//数据表格
class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // 数据表格
            DataTable(
              //排序，默认是升序
              sortColumnIndex: _sortColumnIndex,
              //false降序排列
              sortAscending: _sortAscending,
              // 全选
              onSelectAll: (bool value){},
              // 数据表格的栏目
              columns: [
                DataColumn(
                  label: Text('Title'),
                  // 排序方法，索引号，升序排列
                  onSort: (int index, bool ascending){
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;


                      // 排序的a,b ，如果排序的方法不是ascending的话就把a和b的值调换一下
                      posts.sort((a, b){
                        if(!ascending){
                          final c = a;
                          a = b;
                          b = c;
                        }
                        // 比较a和b的长度
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                    label: Text('Author'),
                ),
                DataColumn(
                    label: Text('Image'),
                  //栏目具体的宽度
//                label: Container(
//                  width: 150,
//                  child: Text('Title'),
                ),
              ],
              // 每一行的内容
//              rows: [
//                DataRow(
//                  // 单元格，一个栏目就一个单元格
//                  cells: [
//                    DataCell(Text('hello ')),
//                    DataCell(Text('Wanghao ')),
//                  ]
//                ),
//                DataRow(
//                  cells: [
//                    DataCell(Text('hola ')),
//                    DataCell(Text('Wanghao ')),
//                  ]
//                ),
//                DataRow(
//                  cells: [
//                    DataCell(Text('您好 ')),
//                    DataCell(Text('Wanghao ')),
//                  ]
//                ),
//              ],
            // 使用列表数据生成，使用map迭代
            rows: posts.map((post){
              return DataRow(
                //行的选择状态
                selected: post.selected,
                // 处理选择动作用的方法，value表示当前选择行的状态
                onSelectChanged: ((bool value){
                  setState(() {
                    if(post.selected != value){
                      post.selected = value;
                    }
                  });
                }),
                cells: [
                  DataCell(Text('post.title')),
                  DataCell(Text('post.author')),
                  DataCell(Image.network(post.imageUrl)),
                ]
              );
            }).toList()
            ),
          ],
        ),
      ),
    );
  }
}
