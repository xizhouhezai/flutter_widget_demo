import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

/// 滑动到指定位置
/// 因为官方一直未支持滑动都执行 item
/// 所有有第三方库另辟蹊径
class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {

  static const maxCount = 100;

  /// pub  scroll_to_index 项目的 controller
  AutoScrollController controller;

  final random = math.Random();

  final scrollDirection = Axis.vertical;

  List<Map> randomList = [
    {
      'index': 0,
      'wordIndex': 'A',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 1,
      'wordIndex': 'B',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 2,
      'wordIndex': 'C',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 3,
      'wordIndex': 'D',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 4,
      'wordIndex': 'E',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 5,
      'wordIndex': 'F',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 6,
      'wordIndex': 'G',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 7,
      'wordIndex': 'H',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 8,
      'wordIndex': 'I',
      'title': '长虹',
      'subtitle': 'changhong'
    },
    {
      'index': 9,
      'wordIndex': 'J',
      'title': '长虹',
      'subtitle': 'changhong'
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    ///一个 index 和 item 高度的数组
    // randomList = List.generate(maxCount, (index) => <int>[index, (100 * random.nextDouble()).toInt()]);
    print(randomList);
  }

  Widget _getRow(int index, String title, String subTitle) {
    return _wrapScrollTag(
        index: index,
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.topCenter,
          height: 80.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 4),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: <Widget>[
              Text('$title'),
              Text('$subTitle'),
            ],
          )
        ));
  }

  Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("ScrollToIndexDemoPage"),
      ),
      body: new Container(
        child: Row(
          children: <Widget>[
            
            Container(
              width: 200.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: ListView(
                scrollDirection: scrollDirection,
                controller: controller,
                children: randomList.map<Widget>((data) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: _getRow(data['index'], data['title'], data['subtitle']),
                  );
                }).toList(),
              ),
            ),

            Container(
              width: 50.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: ListView(
                children: randomList.map<Widget>((data) {
                  return Padding(
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                      onTap: () async {
                        await controller.scrollToIndex(data['index'], preferPosition: AutoScrollPosition.begin);
                        controller.highlight(data['index']);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(top: 5.0),
                        color: Colors.blue,
                        child: Text(
                          '${data['wordIndex']}',
                          style: TextStyle(
                            color: Colors.white
                          ),
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
      persistentFooterButtons: <Widget>[
        new FlatButton(
          onPressed: () async {
            ///滑动到第13个的位置
            await controller.scrollToIndex(12, preferPosition: AutoScrollPosition.begin);
            controller.highlight(12);
          },
          child: new Text("Scroll to 13"),
        ),
      ],
    );
  }
}
