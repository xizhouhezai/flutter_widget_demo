import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  dynamic get(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var result = prefs.get(name);

    result = json.decode(result);

    return result;
  }

  set(String name, Map value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var temp = json.encode(value);

    await prefs.setString(name, temp);
  }
}
