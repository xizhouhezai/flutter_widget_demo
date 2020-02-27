import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridListAnimation extends StatefulWidget {
  GridListAnimation({Key key}) : super(key: key);

  @override
  _GridListAnimationState createState() => _GridListAnimationState();
}

class _GridListAnimationState extends State<GridListAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('单元格动画'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 4,
            //纵轴间距
            mainAxisSpacing: 10.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0
          ),
          itemBuilder: (BuildContext context, index) {
            return AnimationConfiguration.staggeredGrid(
              columnCount: 50,
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Container(
                    color: Theme.of(context).primaryColor,
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
