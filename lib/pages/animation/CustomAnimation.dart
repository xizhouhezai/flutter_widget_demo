import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  CustomAnimation({Key key}) : super(key: key);

  @override
  _CustomAnimationState createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  Animation<Color> colorTween;

  double height = 0;
  
  @override
  void initState() { 
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {
          height = animation.value;
        });
      });

    colorTween = ColorTween(begin: Colors.transparent, end: Colors.blue).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    controller.stop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义动画'),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: colorTween.value,
              width: 50.0,
              height: height,
            )
          ],
        ),
      ),
      
    );
  }
}
