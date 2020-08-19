import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
    DateTime selectDate = DateTime.now();
    // inkwell需要的东西
    TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

    // 异步编程，增加当前程序等待时间返回futer,等待异步执行的结果
    Future<void> _selectDate() async {
    //显示选择日期的对话框，showDatePicker返回的值不能是datetime类型，所以用async方法
     DateTime date = await showDatePicker(
        context: context,
        // 初始日期，默认为当前日期
        initialDate: selectDate,
        // 可以选择最早的日期
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
    );

     //用户点击了cancel就返回null
    if(date == null)return;

    // selectDate的值设为用户选择的值
    setState(() {
      selectDate = date;
    });
  }

    Future<void> _selectTime() async{
      final TimeOfDay time = await showTimePicker(context: context, initialTime: selectedTime);

      if(time == null)return;

      setState(() {
        selectedTime = time;
      });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
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
                InkWell(
                  // 处理点按事件
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      // 时间
                      Text(DateFormat.yMMMd().format(selectDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  // 处理点按事件
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      // 时间
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
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
