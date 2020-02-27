import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnimation extends StatefulWidget {
  ListAnimation({Key key}) : super(key: key);

  @override
  _ListAnimationState createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list动画'),
        elevation: 0
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            print("index-----------------------------------------");
            print(index);
            print("index-----------------------------------------");
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation( //滑动动画
                    verticalOffset: 50.0,
                    child: FadeInAnimation( //渐隐渐现动画
                        child: Container(
                            margin: EdgeInsets.all(5),
                            color: Theme.of(context).primaryColor,
                            height: 60,
                        ),
                    ),
                ),
            );

          },
        ),
      ),
    );
  }
}
