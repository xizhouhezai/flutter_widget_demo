import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/common/service_locator.dart';
import 'package:flutter_widget_demo/common/global_navigator.dart';

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
];

List<Widget> getList(context) {
  var tempList = list.map((value){
    return GestureDetector(
      onTap: () {
        if (value['routeArgs'] == null) {
          // Navigator.pushNamed(context, value['route']);
          // CustomNavigatorObserver.getInstance().navigator.pushNamed("/login");
          getIt<NavigateService>().pushNamed(value['route']);
        } else {
          Navigator.of(context).pushNamed(value['route'], arguments: {'str': value['routeArgs']});
        }
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
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
                    value['title'],
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Text(
                  value['subTitle'],
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
    // Listener(
    //   child: Container(
    //     child: Text(value['title']),
    //     alignment: Alignment.center,
    //     decoration: new BoxDecoration(
    //       color: Colors.white,
          // 这里设置
          // border: new Border.all(width: 1.0, style: BorderStyle.solid),
          // borderRadius: BorderRadius.circular(4),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black54,
          //     offset: Offset(2.0, 2.0),
          //     blurRadius: 4.0
          //   )
          // ]
    //     ),
    //     margin: new EdgeInsets.only(bottom: 10.0),
    //     height: 40.0,
    //   ),
    //   onPointerUp: (event) {
    //     Navigator.pushNamed(context, value['route']);
    //   },
    // );
  });

  return tempList.toList();
}


class HomeIndex extends StatelessWidget {
  const HomeIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: ListView(
          children: getList(context)
        ),
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      ),
    );
  }
}