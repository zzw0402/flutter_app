import 'package:flutter/material.dart';

class ForDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// 注册用户使用的表单
class RegisterForm extends StatefulWidget {
  // 获取用户输入的
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  // 自动验证默认关闭状态
  bool autovalidate = false;

  void submitRegisterForm(){

    // 如果验证通过就输出在控制台，否则就打开自动验证功能
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');

      // 在屏幕中显示
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('registering...')),
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }

    // 保存表单输入的值
    // registerFormKey.currentState.save();
    // 执行验证方法
    // registerFormKey.currentState.validate();
    // debugPrint('username: $username');
    // debugPrint('password: $password');
  }

  String validateUsername(value){
    if(value.isEmpty){
      return 'Username is required.';
    }
    return null;
  }

  String validatePassword(value){
    if(value.isEmpty){
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              // 验证失败的错误信息
              helperText: '',
            ),
            onSaved: (value){
              username = value;
            },
            // 验证表单数据的时候掉用此方法
            validator: validateUsername,
            // 自动验证
            autovalidate: autovalidate,
          ),
          TextFormField(
            // 不显示
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value){
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  // 文本编辑控制器,可以设置初始值
  final textEditingController = TextEditingController();

  // 消化资源
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // 初始数据
  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener((){
      // 监听器，文本框的值有变化就执行指定的方法
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // 每次输入执行这个方法
      // onChanged: (value){
      //   debugPrint('input: $value');
      // },
      // 按下确认后执行的方法
      onSubmitted: (value){
        debugPrint('input: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'title',
        hintText: 'Enter the post title.',
        // 去除下面的边框
        // border: InputBorder.none,
        // 四周边框
        border: OutlineInputBorder(),
        // 背景颜色
        filled: true,  
      ),
      
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 使用在主题中定义的颜色
      color: Theme.of(context).accentColor,
    );
  }
}