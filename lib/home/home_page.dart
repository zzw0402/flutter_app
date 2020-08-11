// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: '第一个flutter程序',
//         theme: ThemeData(backgroundColor: Colors.blue),
//         home: calc());
//   }
// }

// class calc extends StatefulWidget {
//   @override
//   _calcState createState() => _calcState();
// }

// class _calcState extends State<calc> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.yellow,
//         appBar: AppBar(
//           title: Text('计算器'),
//         ),
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 18),
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   alignment: Alignment.bottomRight,
//                   padding: EdgeInsets.only(right: 10),
//                   child: Text(
//                     'text',
//                     maxLines: 1,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 48,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               _CalculatorKeyboard(
//                   // onValueChange: _onValueChange,
//                   ),
//               SizedBox(
//                 height: 80,
//               )
//             ],
//           ),
//         ));
//   }
// }

// class _CalculatorItem extends StatelessWidget {
//   final String text;
//   final Color textColor;
//   final Color color;
//   final Color highlightColor;
//   final double width;
//   final ValueChanged<String> onValueChange;

//   _CalculatorItem(
//       {this.text,
//       this.textColor,
//       this.color,
//       this.highlightColor,
//       this.width,
//       this.onValueChange});

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       decoration: BoxDecoration(
//           color: color, borderRadius: BorderRadius.all(Radius.circular(200))),
//       child: InkWell(
//         onTap: () {
//           onValueChange('$text');
//         },
//         borderRadius: BorderRadius.all(Radius.circular(200)),
//         highlightColor: highlightColor ?? color,
//         child: Container(
//           width: width ?? 70,
//           height: 70,
//           padding: EdgeInsets.only(left: width == null ? 0 : 25),
//           alignment: width == null ? Alignment.center : Alignment.centerLeft,
//           child: Text(
//             '$text',
//             style: TextStyle(color: textColor ?? Colors.white, fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }

// final List<Map> _keyboardList = [
//   {
//     'text': 'AC',
//     'textColor': Colors.black,
//     'color': Color(0xFFA5A5A5),
//     'highlightColor': Color(0xFFD8D8D8)
//   },
//   {
//     'text': '+/-',
//     'textColor': Colors.black,
//     'color': Color(0xFFA5A5A5),
//     'highlightColor': Color(0xFFD8D8D8)
//   },
//   {
//     'text': '%',
//     'textColor': Colors.black,
//     'color': Color(0xFFA5A5A5),
//     'highlightColor': Color(0xFFD8D8D8)
//   },
//   {
//     'text': '÷',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '7', 'color': Color(0xFF363636)},
//   {'text': '8', 'color': Color(0xFF363636)},
//   {'text': '9', 'color': Color(0xFF363636)},
//   {
//     'text': 'x',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '4', 'color': Color(0xFF363636)},
//   {'text': '5', 'color': Color(0xFF363636)},
//   {'text': '6', 'color': Color(0xFF363636)},
//   {
//     'text': '-',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '1', 'color': Color(0xFF363636)},
//   {'text': '2', 'color': Color(0xFF363636)},
//   {'text': '3', 'color': Color(0xFF363636)},
//   {
//     'text': '+',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '0', 'color': Color(0xFF363636), 'width': 158.0},
//   {'text': '.', 'color': Color(0xFF363636)},
//   {
//     'text': '=',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
// ];

// class _CalculatorKeyboard extends StatelessWidget {
//   final ValueChanged<String> onValueChange;

//   const _CalculatorKeyboard({Key key, this.onValueChange}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       runSpacing: 18,
//       spacing: 18,
//       children: List.generate(_keyboardList.length, (index) {
//         return _CalculatorItem(
//           text: _keyboardList[index]['text'],
//           textColor: _keyboardList[index]['textColor'],
//           color: _keyboardList[index]['color'],
//           highlightColor: _keyboardList[index]['highlightColor'],
//           width: _keyboardList[index]['width'],
//           onValueChange: onValueChange,
//         );
//       }),
//     );
//   }
// }
