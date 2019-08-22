import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  final Map arguments;

  AnimationDemo({
    Key key,
    this.arguments
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;

    print(arguments['str']);

    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Center(
        child: Text(arguments['str']),
      ),
    );
  }
}