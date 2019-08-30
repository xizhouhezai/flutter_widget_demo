import 'package:flutter_widget_demo/http/http.dart';

class Global {
  static Map user;  //用户的信息及token

  static Future init() async {
    user = await LocalStorage().get('user');
  }
}