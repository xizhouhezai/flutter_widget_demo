import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multiple_image_picker/flutter_multiple_image_picker.dart';
import 'package:dio/dio.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_editor/image_editor.dart';
// import 'package:kropper/kropper.dart';

class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => new _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  BuildContext context;
  String _platformMessage = 'No Error';
  String images;
  int maxImageNo = 1;
  bool selectSingleImage = true;

  @override
  initState() {
    super.initState();
  }

  updateImage(images) async {

    print('images--------------------------------------------------');
    print(images);
    // print(File(images.buffer.asUint8List()));
    print('images--------------------------------------------------');

    Dio dio = new Dio();
    dio.options.baseUrl = 'http://172.16.0.50:9001';
    dio.options.contentType = ContentType.binary;

    String name;

    var tempName = images.split('/');

    name = tempName[tempName.length - 1];

    print('name--------------------------------------------------');
    print(name);
    // print(File(images.buffer.asUint8List()));
    print('name--------------------------------------------------');

    FormData formData = new FormData.from({
      // "file": File(images.buffer.asUint8List()),
      "file": UploadFileInfo(new File(images), name),
    });
    Response response = await dio.post('/oss/feedback', data: formData);
    print("response-----------------------------------------------");
    print(response.data.toString());
    print("response-----------------------------------------------");
  }

  // Future<Null> _cropImage() async {
  //   File croppedFile = await ImageCropper.cropImage(
  //     sourcePath: images,
  //     maxHeight: 60,
  //     maxWidth: 60,
  //     androidUiSettings: AndroidUiSettings(
  //       toolbarTitle: '裁剪图片',
  //       toolbarColor: Colors.white,
  //       toolbarWidgetColor: Colors.black,
  //       lockAspectRatio: false,
  //       hideBottomControls: true,
  //       initAspectRatio: CropAspectRatioPreset.square,
  //     )
  //   );
  //   print(croppedFile);
  // }

  _cropImage() async {
    // File croppedImage = await Kropper.cropImage(images);
    
    print('-1291-29-192-1931-39-1931-319-39-----');
    // print(croppedImage);
    print('-1291-29-192-1931-39-1931-319-39-----');
  }

  initMultiPickUp() async {
    setState(() {
      images = null;
      _platformMessage = 'No Error';
    });
    List resultList;
    String error;
    try {
      resultList = await FlutterMultipleImagePicker.pickMultiImages(
          maxImageNo, selectSingleImage);
    } on PlatformException catch (e) {
      error = e.message;
    }

    // updateImage(resultList[0]);

    if (!mounted) return;

    setState(() {
      print(resultList);
      images = resultList[0];
      print(File(images.toString()));
      if (error == null) _platformMessage = 'No Error Dectected';
    });

    _cropImage();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Multi-image picker plugin'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // images == null
              //     ? new Container(
              //         height: 300.0,
              //         width: 400.0,
              //         child: new Icon(
              //           Icons.image,
              //           size: 250.0,
              //           color: Theme.of(context).primaryColor,
              //         ),
              //       )
              //     : new Container(
              //         height: 200,
              //         width: 100,
              //         padding: const EdgeInsets.all(5.0),
              //         child: new Image.file(
              //           new File(images.toString()),
              //           fit: BoxFit.contain,
              //         ),
              //       ),
                  // new SizedBox(
                  //     height: 300.0,
                  //     width: 400.0,
                  //     child: new ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (BuildContext context, int index) =>
                  //           new Padding(
                  //             padding: const EdgeInsets.all(5.0),
                  //             child: new Image.file(
                  //               new File(images.toString()),
                  //             ),
                  //           ),
                  //       // itemCount: images.length,
                  //     ),
                  //   ),
              // new Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: new Text('Error Dectected: $_platformMessage'),
              // ),
              new RaisedButton.icon(
                  onPressed: initMultiPickUp,
                  icon: new Icon(Icons.image),
                  label: new Text("Pick-Up Images")),
            ],
          ),
        )
      ),
    );
  }
}
