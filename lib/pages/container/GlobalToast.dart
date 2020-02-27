import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class GlobalToast extends StatefulWidget {
  GlobalToast({Key key}) : super(key: key);

  @override
  _GlobalToastState createState() => _GlobalToastState();
}

class _GlobalToastState extends State<GlobalToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全局的toast'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                RaisedButton(
                  child: Text('弹出一个文本框'),
                  onPressed: () {
                    BotToast.showText(text:"xxxx", align: Alignment.center);
                  },
                ),

                RaisedButton(
                  child: Text('弹出简单通知Toast'),
                  onPressed: () {
                    BotToast.showSimpleNotification(title: "init");
                  },
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
