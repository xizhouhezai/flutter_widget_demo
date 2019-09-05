import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/components/LoginFormField.dart';

class DropDown extends StatefulWidget {
  final List options;
  final TextEditingController optionController;

  DropDown({
    Key key,
    this.options,
    this.optionController
  }) : super(key: key);

  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  List<Widget> drop() {
    var tempList = widget.options.map((val) {
      return SimpleDialogOption(
        child: Text(
          val,
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
        onPressed: () {
          widget.optionController.text = val;
          Navigator.of(context).pop();
        },
      );
    });

    print(tempList.toList().length);
    if (tempList.toList().length == 0) {
      return <Widget>[
        Container(
          child: Text(
            '没有搜索到WIFI，可以手动输入WIFI名',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Color.fromARGB(130, 0, 0, 0)
            ),
          ),
        )
      ];
    }
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          LoginFormField(
            hintText: '请输入验证码',
            textEditingController: widget.optionController,
            maxLength: 30,
            minLength: 30,
          ),
          // 对齐（`Align`）组件，用于将其子项与其自身对齐，并根据子级的大小自行调整大小。
          Align(
            heightFactor: 1.7,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                showDialog<Null>(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text('选择'),
                      children: drop()
                    );
                  },
                );

              },

              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.blue
              ),
            ),
            
          ),

        ],
      ),
    );
  }
}
