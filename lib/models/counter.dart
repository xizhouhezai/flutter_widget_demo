import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/http/http.dart';

// class GetStorage with ChangeNotifier{
//   Map user;

//   get() {
//     user = {'token': 'kdkfjkalkjdk'};
//     notifyListeners();
//   }
// }

class Counter with ChangeNotifier{
  Map user = {};

  increment() async {
    user = await LocalStorage().get('user');
    notifyListeners();
  }
}
