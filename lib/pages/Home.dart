import 'package:flutter/material.dart';

import './tab/home/Home.dart';
import './tab/user/user.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeTab();
  }
}

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List _pageList;
  int _selectedIndex;
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = 0;
    _controller = PageController(initialPage: 0);
    _pageList = List() ..add(HomeIndex()) ..add(User());

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        // physics: NeverScrollableScrollPhysics(),//viewPage禁止左右滑动
        onPageChanged: _pageChange,
        controller: _controller,
        itemCount: _pageList.length,
        itemBuilder: (context, index) => _pageList[index],
      ),
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('用户'))
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _pageChange(int index) {
    print(index);
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onItemTapped(int index) {
    print(_controller);
    _controller.jumpToPage(index);
  }
}

// var list = [
//   {
//     'title': 'Text Widget',
//     'route': '/text',
//     'subTitle': '简单的text widget展示',
//   },
//   {
//     'title': 'Container Widget',
//     'route': '/container',
//     'subTitle': '简单的container widget展示',
//   },
//   {
//     'title': 'flex Widget',
//     'route': '/flex',
//     'subTitle': '简单的flex布局的widget展示',
//   },
//   {
//     'title': '动画 Widget',
//     'route': '/animation',
//     'subTitle': '简单的动画展示',
//     'routeArgs': '大家好'
//   },
// ];
// // List<Widget> getList(context) {
// //   var tempList = list.map((value){
// //     return ListTile(
// //       title: Text(value['title']),
// //       onTap: () {
// //         //路由跳转
// //         Navigator.pushNamed(context, value['route']);
// //       },
// //     );
// //   });
// //   return tempList.toList();
// // }
// List<Widget> getList(context) {
//   var tempList = list.map((value){
//     print('routeArgs--------------------------');
//     print(value['routeArgs']);
//     print('routeArgs--------------------------');
//     return GestureDetector(
//       onTap: () {
//         // print('routeArgs--------------------------');
//         // print(value['routeArgs']);
//         // print('routeArgs--------------------------');
//         if (value['routeArgs'] == null) {
//           Navigator.pushNamed(context, value['route']);
//         } else {
//           Navigator.of(context).pushNamed(value['route'], arguments: {'str': value['routeArgs']});
//         }
//       },
//       child: Container(
//         height: 50,
//         padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
//         child: Row(
//           children: <Widget>[
//             CircleAvatar(
//               radius: 20,
//               backgroundColor: Color(0xFFCCCCCC),
//               backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg'),
//             ),
//             // Image.network(
//             //   'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg',
//             //   height: 40,
//             //   // fit: BoxFit.fitWidth,
//             // ),
//             Padding(
//               padding: EdgeInsets.only(left: 15.0)
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   child: Text(
//                     value['title'],
//                     style: TextStyle(
//                       color: Color(0xFF777777),
//                       fontSize: 15.0,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   alignment: Alignment.centerLeft,
//                 ),
//                 Text(
//                   value['subTitle'],
//                   style: TextStyle(
//                     color: Color(0xFFcccccc),
//                     fontSize: 12.0,
//                   ),
//                   textAlign: TextAlign.left,
//                 )
//               ],
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               style: BorderStyle.solid,
//               color: Color(0xFFCCCCCC),
//               width: 0.5
//             )
//           )
//         ),
//       ),
//     );
//     // Listener(
//     //   child: Container(
//     //     child: Text(value['title']),
//     //     alignment: Alignment.center,
//     //     decoration: new BoxDecoration(
//     //       color: Colors.white,
//           // 这里设置
//           // border: new Border.all(width: 1.0, style: BorderStyle.solid),
//           // borderRadius: BorderRadius.circular(4),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.black54,
//           //     offset: Offset(2.0, 2.0),
//           //     blurRadius: 4.0
//           //   )
//           // ]
//     //     ),
//     //     margin: new EdgeInsets.only(bottom: 10.0),
//     //     height: 40.0,
//     //   ),
//     //   onPointerUp: (event) {
//     //     Navigator.pushNamed(context, value['route']);
//     //   },
//     // );
//   });
//   return tempList.toList();
// }


// class Home extends StatelessWidget {
//   const Home({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Container(
//         child: ListView(
//           children: getList(context)
//         ),
//         padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
//       ),
//     );
//   }
// }