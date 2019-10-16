import 'package:flutter/material.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  AutoScrollController controller;

  final scrollDirection = Axis.vertical;

  List<Map> randomList = [
          {
            'index': 0,
            'wordIndex': 'A',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              },
              {
                'title': '康佳',
                'subtitle': 'kangjia'
              }
            ],
          },
          {
            'index': 1,
            'wordIndex': 'B',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 2,
            'wordIndex': 'C',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 3,
            'wordIndex': 'D',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 4,
            'wordIndex': 'E',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 5,
            'wordIndex': 'F',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 6,
            'wordIndex': 'G',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 7,
            'wordIndex': 'H',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 8,
            'wordIndex': 'I',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
          {
            'index': 9,
            'wordIndex': 'J',
            'data': [
              {
                'title': '长虹',
                'subtitle': 'changhong'
              }
            ],
          },
        ];

  @override
  void initState() {
    setState(() {
      
    });
    controller = AutoScrollController(viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom), axis: scrollDirection);
    super.initState();
  }

  Widget _getRow(int index, List data) {
    return _wrapScrollTag(
      index: index,
      child: Container(
        // color: Colors.lightGreen,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: _getBlock(data),
        )
      )
    );
  }

  List<Widget> _getBlock(List data) {
    var tempList = data.map((val) {

      return GestureDetector(
        onTap: () {
         
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
          ),
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("${val['title']}"),
                Text("${val['subtitle']}"),
              ],
            ),
          ),
        )
        
      );

    });

    return tempList.toList();
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
    key: ValueKey(index),
    controller: controller,
    index: index,
    child: child,
    highlightColor: Colors.white.withOpacity(0.1),
  );
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), //自定义图标
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
        title: Text(
          '联系人',
          style: TextStyle(
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  // color: Colors.blue,
                  child: ListView(
                    scrollDirection: scrollDirection,
                    controller: controller,
                    children: randomList.map<Widget>((data) {

                      return Padding(
                        padding: EdgeInsets.all(1),
                        child: _getRow(data['index'], data['data']),
                      );
                    }).toList(),

                  ),
                ),
              ),

              Container(
                width: 30.0,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 50.0),
                child: ListView(
                  // scrollDirection: scrollDirection,
                  children: randomList.map<Widget>((data) {

                    return Padding(
                      padding: EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () async {
                          print(data['index']);
                          await controller.scrollToIndex(data['index'], preferPosition: AutoScrollPosition.begin);
                          controller.highlight(data['index']);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 2.0, right: 2.0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${data['wordIndex']}',
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                ),
              )

            ],
          ),
        ),
      )
      
    );
  }
}
