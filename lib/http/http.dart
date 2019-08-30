import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  dynamic get(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var result = prefs.get(name);

    if (result == null) {
      return null;
    }

    result = json.decode(result);

    return result;
  }

  set(String name, Map value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var temp = json.encode(value);

    await prefs.setString(name, temp);
  }

  remove(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(name);
  }
}
