import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Widget'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text("默认Text widget")
          ],
        ),
      ),
    );
  }
}