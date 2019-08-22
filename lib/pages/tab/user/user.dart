import 'package:flutter/material.dart';

var funcList = [
  {
    'title': '常用信息',
    'subTitle': '旅客、地址、银行卡'
  },
  {
    'title': '我的点评',
    'subTitle': '图片、点评'
  },
  {
    'title': '我的发票',
    'subTitle': '发票申请与查询'
  },
  {
    'title': '红包中心',
    'subTitle': '免费领红包'
  },
  {
    'title': '免流量',
    'subTitle': '小包网卡'
  },
  {
    'title': '旅游顾问',
    'subTitle': '专属服务',
    'border': 'none'
  }
];

List<Widget> getListAuto() {
  var tempList = funcList.map((value) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: value['border'] == 'none' ? Colors.white : Color(0xFFCCCCCC),
            width: 0.5
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            value['title'],
            style: TextStyle(
              color: Color(0xFF333333),
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                value['subTitle'],
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFaaaaaa),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 22,
                color: Color(0xFFaaaaaa),
              ),
            ],
          )
        ],
      ),
    );
  });
  return tempList.toList();
}

class User extends StatelessWidget {
  const User({Key key}) : super(key: key);

  Widget headerBar() {
    return Container(
      height: 30.0,
      // padding: EdgeInsets.only(top: 30.0),
      // margin: EdgeInsets.only(bottom: 100.0),
      color: Color(0xFF1BC6A4),
      alignment: Alignment.center,
      child: Text('用户中心', style: TextStyle(color: Colors.white)),
    );
  }

  Widget userInfo() {
    return Stack(
      fit: StackFit.passthrough,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 120.0,
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: Container(
            // height: 300.0,
            decoration: BoxDecoration(
              color: Color(0xFF1BC6A4),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 5,
          right: 0,
          bottom: -30,
          child: Container(
            // height: 300.0,
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 4,
                    color: Color.fromARGB(20, 0, 0, 0),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 15.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFCCCCCC),
                          backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0)
                        ),
                        Text(
                          '登录 / 注册',
                          style: TextStyle(
                            fontSize: 17.0
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 15.0
                              ),
                            ),
                            Text(
                              '浏览记录',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0XFFaaaaaa)
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 15.0
                              ),
                            ),
                            Text(
                              '收藏',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0XFFaaaaaa)
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 15.0
                              ),
                            ),
                            Text(
                              '红包优惠券',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0XFFaaaaaa)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget listAuto() {
    return Container(
      height: 245.0,
      margin: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          ),
        ],
      ),
      child: Column(
        children: getListAuto(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     '用户中心',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Color(0xFF1BC6A4),
      // ),
      body: Container(
        color: Color(0xFFEDEFF4),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            this.headerBar(),
            this.userInfo(),
            this.listAuto()
          ],
        ),
      )
    );
  }
}