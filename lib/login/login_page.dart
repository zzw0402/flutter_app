// import 'package:flutter/material.dart';

// // class Login extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Theme(
// //         data: Theme.of(context).copyWith(),
// //         child: Container(
// //           padding: EdgeInsets.all(16.0),
// //           child: TextFieldDemo(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       // initialRoute: '/form',
//       // routes: {
//       //   '/form': (context) => Login(),
//       // },
//       // theme: ThemeData(
//       //     primaryColor: Colors.yellow,
//       //     highlightColor: Color.fromARGB(255, 255, 255, 05),
//       //     splashColor: Colors.white70),

//       home: TextFieldDemo(),
//     );
//   }
// }

// class TextFieldDemo extends StatefulWidget {
//   @override
//   _TextFieldDemoState createState() => _TextFieldDemoState();
// }

// class _TextFieldDemoState extends State<TextFieldDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('登录'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(top: 20),
//             child: TextField(
//               //外观参数，设置对应样式
//               decoration: InputDecoration(
//                 //输入框背景颜色，是否显示
//                 fillColor: Color(0x30cccccc),
//                 filled: true,
//                 // 未输入时显示为圆角矩形
//                 enabledBorder: OutlineInputBorder(
//                     // 边框颜色
//                     borderSide: BorderSide(color: Color(0x00FF0000)),
//                     // 未输入时显示为圆角矩形
//                     borderRadius: BorderRadius.all(Radius.circular(100))),
//                 hintText: '请输入用户名',
//                 // 输入时输入框为圆角矩形
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0x00000000)),
//                     borderRadius: BorderRadius.all(Radius.circular(100))),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 10),
//             child: TextField(
//               decoration: InputDecoration(
//                 fillColor: Color(0x30cccccc),
//                 filled: true,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0x00FF0000)),
//                     borderRadius: BorderRadius.all(Radius.circular(100))),
//                 hintText: '请输入密码',
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0x00000000)),
//                     borderRadius: BorderRadius.all(Radius.circular(100))),
//               ),
//               obscureText: true,
//             ),
//           ),
//           RaisedButton(child: Text('登录'), onPressed: () {})
//         ],
//       ),
//     );
//   }
// }
