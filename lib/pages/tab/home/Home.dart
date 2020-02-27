import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/common/service_locator.dart';
import 'package:flutter_widget_demo/common/global_navigator.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

var list = [
  {
    'title': 'Text Widget',
    'route': '/text',
    'subTitle': '简单的text widget展示',
  },
  {
    'title': 'Container Widget',
    'route': '/container',
    'subTitle': '简单的container widget展示',
  },
  {
    'title': 'flex Widget',
    'route': '/flex',
    'subTitle': '简单的flex布局的widget展示',
  },
  {
    'title': '动画 Widget',
    'route': '/animation',
    'subTitle': '简单的动画展示',
    'routeArgs': '大家好'
  },
  {
    'title': '列表',
    'route': '/list',
    'subTitle': '跳到指定的item',
  },
  {
    'title': '选择图片',
    'route': '/imagePicker',
    'subTitle': '从图库选择图片',
  },
  {
    'title': 'MarkDown',
    'route': '/markdown',
    'subTitle': 'MarkDown',
  },
  {
    'title': '录音',
    'route': '/audio',
    'subTitle': '录音',
  },
  {
    'title': '动画组件',
    'route': '/animator',
    'subTitle': '动画组件',
  },
  {
    'title': '自定义动画组件',
    'route': '/animatorset',
    'subTitle': '自定义动画组件',
  },
  {
    'title': 'GlobalKey',
    'route': '/switchOut',
    'subTitle': 'GlobalKey的使用',
  },
  {
    'title': '贝塞尔曲线',
    'route': '/bezier',
    'subTitle': '贝塞尔曲线',
  },
  {
    'title': '动画',
    'route': '/customAnimation',
    'subTitle': '自定义动画',
  },
  {
    'title': 'list动画',
    'route': '/listAnimation',
    'subTitle': '列表进入动画',
  },
  {
    'title': 'grid动画',
    'route': '/gridListAnimation',
    'subTitle': '单元格进入动画',
  },
  {
    'title': '全局toast',
    'route': '/globalToast',
    'subTitle': '全局toast',
  },
  {
    'title': '自定义的滚动视图',
    'route': '/customScrollView',
    'subTitle': '自定义的滚动视图',
  },
];

Widget getItem(int index) {
  return GestureDetector(
    onTap: () {
      if (list[index]['routeArgs'] == null) {
        // Navigator.pushNamed(context, value['route']);
        // CustomNavigatorObserver.getInstance().navigator.pushNamed("/login");
        getIt<NavigateService>().pushNamed(list[index]['route']);
      } else {
        getIt<NavigateService>().pushNamed(list[index]['route'], arguments: {'str': list[index]['routeArgs']});
      }
    },
    child: Container(
      height: 50,
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFCCCCCC),
            backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  list[index]['title'],
                  style: TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                alignment: Alignment.centerLeft,
              ),
              Text(
                list[index]['subTitle'],
                style: TextStyle(
                  color: Color(0xFFcccccc),
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: Color(0xFFCCCCCC),
            width: 0.5
          )
        )
      ),
    ),
  );
}


class HomeIndex extends StatelessWidget {
  const HomeIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation( //滑动动画
                    verticalOffset: 50.0,
                    child: FadeInAnimation( //渐隐渐现动画
                      child: getItem(index),

                    ),
                ),
            );
          },
        ),
      ),
    );
  }
}