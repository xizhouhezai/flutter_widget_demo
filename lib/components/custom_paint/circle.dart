import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';

class CircleWidght extends StatefulWidget {
  final Color borderColor;
  final double radius;
  final double borderWidth;

  CircleWidght({
    Key key,
    this.borderColor,
    this.radius = 150,
    this.borderWidth = 1.0
  }) : super(key: key);

  @override
  _CircleWidghtState createState() => _CircleWidghtState();
}

class _CircleWidghtState extends State<CircleWidght> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        widget.borderWidth,
        borderColor: widget.borderColor,
        radius: widget.radius,
      ),
      size: Size(widget.radius * 2, widget.radius * 2)
    );
  }
}

class CirclePainter extends CustomPainter {

  final Color borderColor;
  final double radius;
  final double borderWidth;

  double strokeWidth;


  CirclePainter(this.borderWidth, {
    this.borderColor = Colors.black,
    this.radius = 150.0,
  }) {
    strokeWidth = borderWidth;
  }

  

  @override
  void paint(Canvas canvas, Size size) {
    // Paint borderPaint = Paint()
    //   ..color = borderColor
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = borderWidth;
    Paint _paint = Paint()
      ..color = Colors.amber //画笔颜色
      // ..strokeCap = StrokeCap.square //画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //画笔的宽度
    
    canvas.drawCircle(new Offset(radius, radius), radius - strokeWidth / 2, _paint);

  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return true;
  }
}
