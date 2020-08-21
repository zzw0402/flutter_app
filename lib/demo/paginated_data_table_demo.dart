import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/post.dart';

//表格数据源的类
class PostDataSource extends DataTableSource{
  final List<Post> _posts = posts;
  int _selectedCount = 0;

   //行的数量
  @override
  int get rowCount => _posts.length;

  //不确定行的数量返回true
  @override
  bool get isRowCountApproximate => false;

  //获取选择行数的时候执行此方法
  @override
  int get selectedRowCount => _selectedCount;

  // 每一行具体的内容
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  //方法参数getField，需提供列表里的项目
  void _sort(getField(post), bool ascending){
    // 判断
    _posts.sort((a, b){
      if(!ascending){
        final c = a;
        a = b;
        b = c;
      }
      final avalue = getField(a);
      final bvalue = getField(b);

      // 比较
      return Comparable.compare(avalue, bvalue);
    });
    
    notifyListeners();
  }
}

// 分页显示数据的表格
class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource  _postsDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // 数据表格
            PaginatedDataTable(
              // 头部，标题
              header: Text('Posts'),
              // 表格具体的数据
              source: _postsDataSource,
              // 控制每一页显示的行数
              rowsPerPage: 5,
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
                    onSort: (int columnIndex, bool ascending){
                      // 数据来源_postsDataSource,第一个参数以标题的长度来作为排序的依据,是否使用升序排列
                      _postsDataSource._sort((post) => post.title.length, ascending);
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;

                      });
                    },
                  ),
                  DataColumn(
                    label: Text('Author'),
                  ),
                  DataColumn(
                    label: Text('Image'),
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}
