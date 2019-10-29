import 'dart:ui';

import 'package:flutter/material.dart';

class Wave extends StatefulWidget {
  final Color backgroundColor;
  final int duration; // 波浪移动的速度
  final double startOffset; // 调整起始点的位移
  final int waveHeight; // 波浪高

  Wave({
    Key key,
    this.backgroundColor = Colors.blue,
    this.duration = 2000,
    this.startOffset = 0,
    this.waveHeight = 30
  }) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation;

  final double _waveLength = 200; //波浪长

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    animation = Tween<double>(begin: 0, end: 200).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    animationController.stop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BezierPainter1(
        animation.value, _waveLength,
        backgroundColor: widget.backgroundColor,
        startOffset: widget.startOffset,
        waveHeight: widget.waveHeight
      ),
    );
  }
}

class BezierPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var startPoint = Offset(0, size.height / 2);
    var firstControllPoint = Offset(size.width / 4, 0);
    var secondControllPoint = Offset(size.width / 4, 0);
    var endPoint = Offset(size.width / 2, size.height / 2);
    print(size);

    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    var path = Path();

    path.moveTo(startPoint.dx, startPoint.dy);

    path.cubicTo(firstControllPoint.dx, firstControllPoint.dy, secondControllPoint.dx, secondControllPoint.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);

  }

  @override
  shouldRepaint(BezierPainter oldDelegate) {
    return true;
  }
  
}

class BezierPainter1 extends CustomPainter {
  final Color backgroundColor;

  final double myOffsetX; //平移量
  final int waveHeight; //波浪高
  final double waveLength; //一个波浪的长度

  final double startOffset;

  // Paint _pointPaint; //点画笔
  Paint _pathPaint; //线画笔
  Paint _whitePaint; //空白画笔

  double _screenHeight; //屏幕高
  double _screenWidth; //屏幕宽
  double _centerY; //屏幕中间Y坐标

  int _waveCount; //波浪个数

  Path _path = Path(); //路径

  BezierPainter1(this.myOffsetX, this.waveLength, {this.backgroundColor, this.startOffset, this.waveHeight}) {
    // print(myOffsetX);
    // _pointPaint = Paint()
    //   ..color = Colors.grey
    //   ..strokeWidth = 6
    //   ..isAntiAlias = true
    //   ..style = PaintingStyle.fill;
    _pathPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..strokeWidth = 1;

    _whitePaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..strokeWidth = 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _screenHeight = size.height; //屏幕高,这里不是一直成立,像当有Center 父控件的时候就不成立

    _screenWidth = size.width; //屏幕宽

    _waveCount = (_screenWidth / waveLength).round() + 2; //根据波长算出波的个数,这里的波浪个数多一点,这样可以在屏幕内看到更完整的波浪

    // print("_waveCount---------------------------_waveCount");
    // print((_screenWidth / waveLength).round());
    // print("_waveCount---------------------------_waveCount");

    _centerY = _screenHeight / 2; //中心高度的值

    _path.moveTo(
        -waveLength + this.myOffsetX  + startOffset, _centerY); //把画笔的起点移到屏幕外的一个波长处,Y轴在屏幕中间
    //this.myOffsetX水平方向的偏移量
    for (int i = 0; i < _waveCount; i++) {
      canvas.save();
      canvas.restore();
      //绘制波谷,控制点在(-3M/4,_centerY),结束点在(-waveLength / 2,_centerY)
      //此处可以先把(waveLength * i) + this.myOffsetX 这段代码移除,所画的就是一个波谷,屏幕外的波谷
      _path.quadraticBezierTo(
          -waveLength / 4 * 3 + (waveLength * i) + this.myOffsetX + startOffset,
          _centerY + waveHeight,
          -waveLength / 2 + (waveLength * i) + this.myOffsetX + startOffset,
          _centerY);

      // print("start---------------------------start");
      // print((-waveLength / 4 * 3 + (waveLength * i)));
      // print("start---------------------------start");
      //绘制波峰,控制点在(-M/4,_centerY),结束点在(0,_centerY)
      //此处可以先把(waveLength * i) + this.myOffsetX 这段代码移除,所画的就是一个波峰,屏幕外的波峰
      _path.quadraticBezierTo(
          -waveLength / 4 + (waveLength * i) + this.myOffsetX + startOffset,
          _centerY - waveHeight,
          0 + waveLength * i + this.myOffsetX + startOffset,
          _centerY);
      canvas.drawPath(_path, _whitePaint); //绘制
    }

    ///封闭绘制区域,构成“深水面”
    _path.lineTo(_screenWidth, _screenHeight); //将画笔从当前位置画到屏幕最右下角
    _path.lineTo(0, _screenHeight); //画到屏幕左下角
    _path.close();
    canvas.drawPath(_path, _pathPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
