import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../pages/Home.dart';
import '../pages/text/Text.dart';
import '../pages/container/Container.dart';
import '../pages/flex/Flex.dart';
import '../pages/animation/Animation.dart';

final routes = {
  '/': (context) => Home(),
  '/text': (context) => TextDemo(),
  '/container': (context) => ContainerDemo(),
  '/flex': (context) => FlexDemo(),
  '/animation': (context, {arguments}) => AnimationDemo(arguments: arguments)
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    print('----------------------------');
    print(name);
    print('----------------------------');
    
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
        builder: (context) =>
          pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      Route route;
      if (name == '/') {
        // route = MaterialPageRoute(builder: (context) => pageContentBuilder(context), fullscreenDialog: true);
        route = PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
            return new FadeTransition(
              //使用渐隐渐入过渡,
              opacity: animation,
              child: pageContentBuilder(context), //路由B
            );
          },
        );
      } else {
        route = CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      }
       
      return route;
    }
  }
};
