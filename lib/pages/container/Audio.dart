import 'package:flutter/material.dart';

import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path_provider/path_provider.dart';


class AudioDemo extends StatefulWidget {
  // final LocalFileSystem localFileSystem;
  AudioDemo({Key key}) : super(key: key);

  _AudioDemoState createState() => _AudioDemoState();
}

class _AudioDemoState extends State<AudioDemo> {
  LocalFileSystem localFileSystem;

  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() { 
    super.initState();
    setState(() {
      localFileSystem = LocalFileSystem();
    });
  }

  start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        print('-0-0-0-0-0-0-0-0-0-0-0-0-0-');
        print(isRecording);
        print('-0-0-0-0-0-0-0-0-0-0-0-0-0-');
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }


  stop() async {
    print('11111111111111111111');
    // Directory documentsDir = await getApplicationDocumentsDirectory();

    // String documentsPath = documentsDir.path;

    print('19283918398182319083109831082391028123');

    // print(documentsPath);
  
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = localFileSystem.file(recording.path);

    // File files = File(recording.path);

    // File file1 = await files.writeAsString(recording.path);

    // if(file1.existsSync()) {
    //   print(file1);
    // }
    
    print(file);
    print("  File length: ${await file.length()}");

    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
  }

  

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
          'Audio',
          style: TextStyle(
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: new Builder(builder: (BuildContext context){
        return Center(
          child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new FlatButton(
                    onPressed: _isRecording ? null : start,
                    child: new Text("Start"),
                    color: Colors.green,
                  ),
                  new FlatButton(
                    onPressed: _isRecording ? stop : null,
                    child: new Text("Stop"),
                    color: Colors.red,
                  ),
                  new TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: 'Enter a custom path',
                    ),
                  ),
                  new Text("File path of the record: ${_recording.path}"),
                  new Text("Format: ${_recording.audioOutputFormat}"),
                  new Text("Extension : ${_recording.extension}"),
                  new Text(
                      "Audio recording duration : ${_recording.duration.toString()}")
                ]),
          ),
        );
      }),
      
      
    );
  }

}
