import 'package:flutter/material.dart';

final TextStyle _textFieldStyle = TextStyle(
  fontSize: 20.0,
  letterSpacing: 0.78,
  fontFamily: 'Roboto',
  color: const Color.fromARGB(222, 0, 0, 0),
);

final TextStyle _hintStyle = TextStyle(
  fontSize: 16.0,
  color: Color.fromARGB(30, 0, 0, 0),
);

class LoginFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final int maxLength;
  final int minLength;

  /// 文本字段长度合理时的回调函数。
  final Function legitimateCallback;

  /// 文本字段长度不合理时的回调函数。
  final Function illegalCallback;

  LoginFormField({
    @required
    this.hintText,
    this.textEditingController,
    this.maxLength,
    this.minLength,
    this.legitimateCallback,
    this.illegalCallback,
  });

  @override
  _LoginFormFieldState createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  /// 文本字段下方的提示颜色。
  Color inputColor;

  @override
  void initState() {
    super.initState();
    inputColor = Color(0xFFC5C5C5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: widget.textEditingController,
          style: _textFieldStyle,
          keyboardType: TextInputType.number,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintStyle: _hintStyle,

            // 自定义placehodler文本
            hintText: widget.hintText,
          ),
          onChanged: (value) {
            // 当前文本字段中值的长度。
            int fieldValue = value.trim().length;
            if (fieldValue == 0) {
              inputColor = Color(0xFFC5C5C5);
            } else if (fieldValue > widget.maxLength) {
              inputColor = Color(0xFFFF3E44);
            } else {
              inputColor = Color(0xFF00CED2);
            }
            setState(() {});
            // 当前文本字段中值的长度符合给定范围时调用回调函数。
            if (fieldValue > widget.minLength-1 && fieldValue < widget.maxLength+1) {
              widget.legitimateCallback();
            } else {
              widget.illegalCallback();
            }
          },
        ),
        // 下划线
        Container(
          height: 0.5,
          color: const Color(0xFFcccccc),
        ),
        Container(
          height: 0.5,
          color: inputColor,
        ),
      ],
    );
  }
}


 