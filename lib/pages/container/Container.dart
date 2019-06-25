import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Widget'),
      ),
      body: Center(
        child: Container(
          child: Text("这里是一个Container Widget"),
          height: 300.0,
          width: 200.0,
          //color: Colors.blue, //背景色
          // 用于装饰Container Widget
          decoration: BoxDecoration(
            color: Colors.blue,
            // 边框设置
            border: Border.all(
              color: Colors.red,
              width: 2.0
            )
          ),
        ),
      )
    );
  }
}