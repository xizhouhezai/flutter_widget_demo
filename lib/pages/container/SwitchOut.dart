import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/pages/container/Switch.dart';

class SwitchOut extends StatefulWidget {
  SwitchOut({Key key}) : super(key: key);

  _SwitchOutState createState() => _SwitchOutState();
}

class _SwitchOutState extends State<SwitchOut> {
  final GlobalKey<SwitchGlobalState> key = GlobalKey<SwitchGlobalState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitchGlobal(
        key: key,
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('global', style: TextStyle(color: Colors.white)),
        onPressed: () {
          key.currentState.changeState();
        }
      ),
    );
  }
}
