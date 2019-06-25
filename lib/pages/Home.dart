import 'package:flutter/material.dart';

var list = [
  {
    'title': 'Text Widget',
    'route': '/text'
  },
  {
    'title': 'Container Widget',
    'route': '/container'
  }
];
List<Widget> getList(context) {
  var tempList = list.map((value){
    return ListTile(
      title: Text(value['title']),
      onTap: () {
        //路由跳转
        Navigator.pushNamed(context, value['route']);
      },
    );
  });
  return tempList.toList();
}


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

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
      ),
    );
  }
}