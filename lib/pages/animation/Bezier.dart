import 'package:flutter/material.dart';

import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

import 'package:flutter_widget_demo/components/custom_paint/time.dart';
// import 'package:flutter_widget_demo/components/custom_paint/circle.dart';
import 'package:flutter_widget_demo/components/custom_paint/wave.dart';

import 'package:permission_handler/permission_handler.dart';

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
          ),

          Container(
            width: 100.0,
            child: Material(
              color: Colors.greenAccent,
              child: InkWell(
                onTap: () {
                  
                  showDialog<Null>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('提醒'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "是否进入设置，打开权限"
                                )
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              '取消',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                            
                          FlatButton(
                            child: Text(
                              '确定',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onPressed: () async {
                              await PermissionHandler().openAppSettings();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    
                    }
                  );

                },
                child: Container(
                  height: 40.0,
                  width: 90.0,
                  alignment: Alignment.center,
                  child: Text(
                    "打开设置",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          
          
        ],
      )
    );
  }
}
