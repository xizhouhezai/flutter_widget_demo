import 'package:flutter/material.dart';

import '../pages/Home.dart';
import '../pages/text/Text.dart';
import '../pages/container/Container.dart';

final routes = {
  '/': (context) => Home(),
  '/text': (context) => TextDemo(),
  '/container': (context) => ContainerDemo()
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
          pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
