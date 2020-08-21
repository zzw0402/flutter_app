import 'package:flutter/material.dart';

// 步骤
class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StepperDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 覆盖掉部分主体的配置
              Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.black,
                ),
                //步骤
                child: Stepper(
                  //控制当前打开的步骤
                  currentStep: _currentStep,
                  // value表示当前被按的索引值
                  onStepTapped: (int value) {
                    setState(() {
                      _currentStep = value;
                    });
                  },
                  //继续按钮
                  onStepContinue: () {
                    setState(() {
                      _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                    });
                  },
                  //取消按钮
                  onStepCancel: () {
                    setState(() {
                      _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                    });
                  },
                  steps: [
                    Step(
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content: Text('Magna exercitation duis non sint eu nostrud.'),
                      // 步骤的激活状态
                      isActive: _currentStep == 0,
                    ),
                    Step(
                      title: Text('Choose Plan'),
                      subtitle: Text('Choose you plan.'),
                      content: Text('Magna exercitation duis non sint eu nostrud.'),
                      isActive: _currentStep == 1,
                    ),
                    Step(
                      title: Text('Confirm payment'),
                      subtitle: Text('Confirm your payment method.'),
                      content: Text('Magna exercitation duis non sint eu nostrud.'),
                      isActive: _currentStep == 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}