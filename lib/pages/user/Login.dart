import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/common/global.dart';
import 'package:flutter_widget_demo/http/http.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            child: Text('登录'),
            onPressed: () async {
              Map user = {'token': 'jfjfkdkjfksajksdak', 'name': 'Tom'};

              Global.user = user;

              await LocalStorage().set('user', user);

              Navigator.pushNamed(context, '/');
            },
          ),
        ),
      ),
    );
  }
}