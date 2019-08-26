import 'package:flutter/material.dart';

import '../../http/http.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Container Widget'),
      ),
      body: Center(
        child: Container(
          child: Text("这里是一个Container Widget"),
          height: 300.0,
          width: 200.0,
          alignment: Alignment.center,
          //color: Colors.blue, //背景色
          // 用于装饰Container Widget
          decoration: BoxDecoration(
            // color: Colors.blue,
            // 边框设置
            border: Border.all(
              color: Colors.red,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 6,
                spreadRadius: 10,
                color: Color.fromARGB(20, 0, 0, 0),
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red, Colors.blue]
            ),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
      )
    );
  }
}

_getUser() async {
  
  print('user----------------------------');
  var i = await LocalStorage().get('user');

  print(i['token']);
  print('user----------------------------');
}
