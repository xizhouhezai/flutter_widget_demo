import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyTextInput extends StatefulWidget {
  final String hint;
  final double height;
  final Function(String) onChanged;

  MyTextInput({
    Key key,
    this.hint,
    this.onChanged,
    this.height,
  }) : super(key: key);

  _MyTextInputState createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _textInput(widget.hint),
    );
  }

  String result = "";

  _textInput(String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.all(
            //   Radius.circular(4.0),
            // ),
            border: Border.all(color: Color(0xFFDEDEDE)),
          ),
          alignment: AlignmentDirectional.topStart,
          margin: EdgeInsets.only(bottom: 10.0),
          child: CupertinoTextField(
            placeholder: hint,
            style: TextStyle(fontSize: 13.0, color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            maxLines: 10,
            maxLength: 120,
            maxLengthEnforced: true,
            textInputAction: TextInputAction.unspecified,
            onChanged: (str) {
              
              widget.onChanged(result);
              setState(() {
                result = str;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 25, right: 20),
          child: Text(
            result.length.toString() + "/120",
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
