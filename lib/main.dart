import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'package:flutter_widget_demo/common/global.dart';
import 'routes/Routes.dart';
import 'package:flutter_widget_demo/models/counter.dart';

void main() {
  var counter = Counter();

  var providers = Providers();

  providers
    ..provide(Provider<Counter>.value(counter));

  Global.init().then((e) => runApp(ProviderNode(child: MyApp(), providers: providers)));
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {        
        return routeHandler(settings: settings);
      },
    );
  }
}
