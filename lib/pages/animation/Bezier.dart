import 'package:flutter/material.dart';

import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

import 'package:flutter_widget_demo/components/custom_paint/time.dart';
import 'package:flutter_widget_demo/components/custom_paint/circle.dart';
import 'package:flutter_widget_demo/components/custom_paint/wave.dart';

class Bezier extends StatefulWidget {
  Bezier({Key key}) : super(key: key);

  @override
  _BezierState createState() => _BezierState();
}

class _BezierState extends State<Bezier> {

  WaterController waterController=WaterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝塞尔曲线'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[

          ClockPage(),

          // CircleWidght(),

          Container(
            height: 100.0,
            color: Colors.blue,
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: Wave(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.35),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: Wave(
                    // startOffset: 100,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.85),
                    duration: 1200,
                    waveHeight: 50,
                  ),
                ),
              ],
            ),
          )
          
        ],
      )
    );
  }
}
