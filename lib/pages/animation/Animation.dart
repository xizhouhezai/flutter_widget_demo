import 'package:flutter/material.dart';
// import 'package:provide/provide.dart';
import 'package:toast/toast.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// import 'package:flutter_widget_demo/models/counter.dart';
import '../../http/http.dart';
import 'package:flutter_widget_demo/components/LoginFormCode.dart';
import 'package:flutter_widget_demo/components/LoginFormField.dart';

import 'package:flutter_widget_demo/components/DropDown.dart';

class AnimationDemo extends StatefulWidget {
  final Map arguments;
  AnimationDemo({Key key, this.arguments}) : super(key: key);

  _AnimationDemoState createState(){
    return _AnimationDemoState(arguments: arguments);
  }
}

class _AnimationDemoState extends State<AnimationDemo> {
  final Map arguments;
  Map _user;

  final _codeController = TextEditingController();
  /// 发送验证码按钮是否可用。
  bool _codeAvailable = false;

  /// 验证码文本字段是否符合格式。
  bool _codeActivation = false;

  _AnimationDemoState({this.arguments});

  final _optionController = TextEditingController();

  @override
  void initState() { 
    super.initState();

    // LocalStorage().remove('user'); 

    setUser();
    
    _incrementCounter();
  }

  void _incrementCounter() async {
    var user = await LocalStorage().get('user');
    print(user);
    setState(() {
      _user = user;
      print(_user);
    });
  }
  
  @override
  Widget build(BuildContext context) {

    print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(arguments['str']),
            Text(_user == null ? '' : _user['name']),
            Stack(
              children: <Widget>[
                LoginFormField(
                  hintText: '请输入验证码',
                  textEditingController: _codeController,
                  maxLength: 6,
                  minLength: 6,
                  legitimateCallback: () {
                    setState(() {
                      _codeActivation = true;
                    });
                  },
                  illegalCallback: () {
                    setState(() {
                      _codeActivation = false;
                    });
                  },
                ),
                // 对齐（`Align`）组件，用于将其子项与其自身对齐，并根据子级的大小自行调整大小。
                Align(
                  heightFactor: 1.7,
                  alignment: Alignment.centerRight,
                  child: LoginFormCode(
                    countdown: 60,
                    available: !_codeAvailable,
                    onTapCallback: () {
                      // print('_codeController------------------------------------------');
                      // print(_codeController.text);
                      // print('_codeController------------------------------------------');
                    },
                  ),
                ),

              ],
            ),

            DropDown(
              options: [],
              optionController: _optionController,
            ),

            Text('dkfjdksjal'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Provide.value<Counter>(context).increment();
          // await LocalStorage().remove('user');
          print('_optionController------------------------------------------');
          print(_optionController.text);
          print('_optionController------------------------------------------');
          Toast.show("Toast plugin app", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// class AnimationDemo extends StatelessWidget {
//   final Map arguments;

//   AnimationDemo({
//     Key key,
//     this.arguments
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // var args = ModalRoute.of(context).settings.arguments;

//     print(arguments['str']);
//     _incrementCounter();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('动画'),
//       ),
//       body: Center(
//         child: Text(arguments['str']),
//       ),
//     );
//   }
// }

setUser() async {
  await LocalStorage().set('user', {'token': 'jdkjflajidjfkdjaljfieojajdf', 'name': 'Tom'});
}
