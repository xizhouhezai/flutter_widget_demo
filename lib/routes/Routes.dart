import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_widget_demo/common/global.dart';

import 'package:flutter_widget_demo/pages/Home.dart';
import 'package:flutter_widget_demo/pages/text/Text.dart';
import 'package:flutter_widget_demo/pages/container/Container.dart';
import 'package:flutter_widget_demo/pages/flex/Flex.dart';
import 'package:flutter_widget_demo/pages/animation/Animation.dart';
import 'package:flutter_widget_demo/pages/user/Login.dart';
import 'package:flutter_widget_demo/pages/container/List.dart';
import 'package:flutter_widget_demo/pages/container/Contacts.dart';
import 'package:flutter_widget_demo/pages/container/ImagePicker.dart';
import 'package:flutter_widget_demo/pages/container/Markdown.dart';
import 'package:flutter_widget_demo/pages/container/Audio.dart';
import 'package:flutter_widget_demo/pages/animation/Animator.dart';
import 'package:flutter_widget_demo/pages/animation/Animatorset.dart';
import 'package:flutter_widget_demo/pages/container/SwitchOut.dart';
import 'package:flutter_widget_demo/pages/animation/Bezier.dart';
import 'package:flutter_widget_demo/pages/animation/CustomAnimation.dart';

final routes = {
  '/': (context) => Home(),
  '/text': (context) => TextDemo(),
  '/container': (context) => ContainerDemo(),
  '/flex': (context) => FlexDemo(),
  '/animation': (context, {arguments}) => AnimationDemo(arguments: arguments),
  '/login': (context) => Login(),
  '/list': (context) => ListDemo(),
  '/contacts': (context) => Contacts(),
  '/imagePicker': (context) => ImagePicker(),
  '/markdown': (context) => MarkdownDemo(),
  '/audio': (context) => AudioDemo(),
  '/animator': (context) => Animator(),
  '/animatorset': (context) => Animatorset(),
  '/switchOut': (context) => SwitchOut(),
  '/bezier': (context) => Bezier(),
  '/customAnimation': (context) => CustomAnimation(),
};

//固定写法
Route routeHandler({@required RouteSettings settings}) {
  // 统一处理
  final String name = settings.name;

  var user = Global.user;

  print('----------------------------');
  print(user);
  print('----------------------------');

  Function pageContentBuilder;

  if (user == null && name != '/login') {
    pageContentBuilder = routes['/login'];
  } else {
    pageContentBuilder = routes[name];
  }
  
  if (pageContentBuilder != null) {
    
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
        builder: (context) =>
          pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    } else {
      Route route;

      // 处理单独的路由转场动画
      switch (name) {
        case '/':
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
          break;
        default:
          route = CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      }
       
      return route;
    }
  }
}
