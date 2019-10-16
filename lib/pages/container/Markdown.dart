import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:path_provider/path_provider.dart';


class MarkdownDemo extends StatefulWidget {
  MarkdownDemo({Key key}) : super(key: key);

  _MarkdownDemoState createState() => _MarkdownDemoState();
}

class _MarkdownDemoState extends State<MarkdownDemo> {
  String _markdownData = "";

  @override
  void initState() { 
    super.initState();
    getMd();
  }

  getMd() async {

    Future<String> loadString = DefaultAssetBundle.of(context).loadString("app_flutter/doc/使用条款.md");

    loadString.then((String value){
      // 通知框架此对象的内部状态已更改
      print(value);
      setState(() {
        _markdownData = """$value""";
      });
    });

  }

  // Future<File> _getLocalFile() async {
  //   // 获取文档目录的路径
  //   // Directory appDocDir = await getApplicationDocumentsDirectory();
  //   // String dir = appDocDir.path;
  //   final file = new File('app_flutter/doc/使用条款.md');
  //   print(file);
  //   return file;
  // }

  // void _readContent() async {
  //   File file = await _getLocalFile();
  //   // 从文件中读取变量作为字符串，一次全部读完存在内存里面
  //   String contents = await file.readAsString();

  //   print(contents);
  //   setState(() {
  //     _markdownData = contents;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // _readContent();

    return Scaffold(
      appBar: AppBar(
        title: Text('Markdown'),
        elevation: 0,
      ),
      body: Markdown(data: _markdownData),
    );
  }
}
