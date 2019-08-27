import 'package:flutter/material.dart';

import 'routes/Routes.dart';

void main() => runApp(MyApp());



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
