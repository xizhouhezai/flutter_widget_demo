import 'package:flutter/material.dart';

class SwitchGlobal extends StatefulWidget {
  SwitchGlobal({Key key}) : super(key: key);

  SwitchGlobalState createState() => SwitchGlobalState();
}

class SwitchGlobalState extends State<SwitchGlobal> {

  bool isActive = false;

  changeState() {
    isActive = !isActive;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch.adaptive(
            value: isActive,
            onChanged: (bool currentStatus) {
              isActive = currentStatus;
              setState(() {});
            }),
      ),
    );
  }
}
