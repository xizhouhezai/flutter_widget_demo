import 'package:flutter/material.dart';

// import 'package:aix_app/basic/config.dart';

class CircleCheckbox extends StatefulWidget {
  final bool value; //是否被选择
  final double size; //按钮的大小

  CircleCheckbox({
    Key key,
    this.value,
    this.size
  }) : super(key: key);

  _CircleCheckboxState createState() => _CircleCheckboxState();
}

class _CircleCheckboxState extends State<CircleCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: widget.value
          ? Icon(
              Icons.radio_button_checked,
              size: widget.size,
              color: Colors.blue,
            )
          : Icon(
              Icons.radio_button_unchecked,
              size: widget.size,
              color: Colors.grey,
            ),
    );
  }
}
