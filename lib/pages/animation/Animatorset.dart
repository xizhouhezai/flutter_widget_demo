import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

// import 'dart:math' as math;

class Animatorset extends StatefulWidget {
  Animatorset({Key key}) : super(key: key);

  _AnimatorsetState createState() => _AnimatorsetState();
}

class _AnimatorsetState extends State<Animatorset> {

  Color endColor = Colors.grey;
  Timer timer;

  bool rShow = false;

  Widget R() {
  
    return Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: 0,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            rShow ? AnimatorSet(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0XFF2148BE), width: 4),
                ),
              ),
              animatorSet: [
                Serial(duration: 1200, serialList: [
                  SX(from: 0.5, to: 1.2),
                  SY(from: 0.5, to: 1.2),
                  O(from: 0.5, to: 0),
                ]),
                Delay(duration: 600),
              ],
            ) : Container(),
            rShow ? AnimatorSet(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0XFF2148BE), width: 3),
                ),
              ),
              animatorSet: [
                Serial(duration: 1200, serialList: [
                  SX(from: 0.6, to: 1.2),
                  SY(from: 0.6, to: 1.2),
                  O(from: 0.5, to: 0),
                ]),
                Delay(duration: 600),
              ],
            ) : Container(),
            rShow ? AnimatorSet(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0XFF2148BE), width: 2),
                ),
              ),
              animatorSet: [
                Delay(duration: 600),
                Serial(duration: 1200, serialList: [
                  SX(from: 0.7, to: 1.2),
                  SY(from: 0.7, to: 1.2),
                  O(from: 0.5, to: 0),
                ]),
              ],
            ) : Container(),

            Container(
              width: 65,
              height: 65,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF547DF9),
                // border: Border.all(color: Colors.white, width: 3),
              ),
              child: Icon(
                Icons.keyboard_voice,
                color: Colors.white,
                size: 35.0,
              ),
            ),

          ],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用animation组件自定义动画'),
        elevation: 0,
        titleSpacing: 0,
      ),
      body: ListView(
        children: <Widget>[

          Container(
            height: 100,
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    makeWave(0, 500),
                    makeWave(100, 400),
                    makeWave(200, 300),
                    makeWave(300, 200),
                    makeWave(400, 100),
                    makeWave(500, 0),
                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: GestureDetector(
                onTapDown: (e) {
                  setState(() {
                    timer.cancel();
                    endColor = Colors.blue;
                  });
                },
                onTapUp: (e) {

                  timer = new Timer(new Duration(seconds: 2), () {
                    setState(() {
                      endColor = Colors.grey;
                    });
                  });
                  
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: AnimatorSet(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                    ),
                    animatorSet: [
                      Serial(
                        duration: 2000,
                        serialList: [
                          SX(from: 0.0, to: 1.0, curve: Curves.easeInOut),
                          SY(from: 0.0, to: 1.0, curve: Curves.easeInOut),
                          C(from: Colors.grey, to: endColor, delay: 1000, curve: Curves.easeInOut),
                          O(from: 1, to: 0.0, delay: 1000, curve: Curves.easeInOut),
                          B(from: BorderRadius.circular(20.0), to: BorderRadius.circular(20.0), delay: 1000, curve: Curves.easeInOut)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 100,
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: AnimatorSet(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                animatorSet: [
                  Serial(
                    duration: 2000,
                    serialList: [
                      SX(from: 0.0, to: 1.0, curve: Curves.easeInOut),
                      SY(from: 0.0, to: 1.0, curve: Curves.easeInOut),
                      C(from: Colors.grey, to: Colors.blue, delay: 1000, curve: Curves.easeInOut),
                      O(from: 0.5, to: 0.0, delay: 1000, curve: Curves.easeInOut),
                      B(from: BorderRadius.circular(20.0), to: BorderRadius.circular(20.0), delay: 1000, curve: Curves.easeInOut)
                    ],
                  )
                ],
              )
            ),
          ),

          Container(
            height: 200,
            alignment: Alignment.center,
            child: Container(
              width: 180,
              height: 180,
              color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: GestureDetector(
                      onTapDown: (e) {
                        setState(() {
                          rShow = true;
                        });
                      },
                      onTapUp: (e) {
                        setState(() {
                          rShow = false;
                        });
                      },
                      child: R()
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 5.0),),

                  !rShow ? Text(
                    '发指令',
                    style: TextStyle(
                      color: Color(0xFF547DF9),
                    ),
                  ) : Text(''),

                ],
              )
              
              
            )
            
          ),

        ],
      ),
    );
  }
}

Widget makeWave(int before, int after) {
  return AnimatorSet(
    child: Container(
      color: Colors.white,
      width: 5,
      height: 15,
    ),
    animatorSet: [
      Delay(duration: before),
      SY(from: 0.8, to: 1.6, duration: 200, delay: 0, curve: Curves.linear),
      SY(from: 1.6, to: 0.8, duration: 200, delay: 0, curve: Curves.linear),
      Delay(duration: after),
    ],
  );
}

