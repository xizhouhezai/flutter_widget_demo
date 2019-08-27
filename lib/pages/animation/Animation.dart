import 'package:flutter/material.dart';

import '../../http/http.dart';

class AnimationDemo extends StatefulWidget {
  final Map arguments;
  AnimationDemo({Key key, this.arguments}) : super(key: key);

  _AnimationDemoState createState(){
    print(arguments);
    print('1111111111111111');
    return _AnimationDemoState(arguments: arguments);
  }
}

class _AnimationDemoState extends State<AnimationDemo> {
  final Map arguments;
  Map _user;

  _AnimationDemoState({this.arguments});

  @override
  void initState() { 
    super.initState();

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
            Text(_user['name'])
          ],
        ),
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
