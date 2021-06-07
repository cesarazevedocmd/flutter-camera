import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();

  File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Take a picture', style: TextStyle(fontSize: 25)),
            _file != null
                ? Image.file(
                    _file,
                    width: 300,
                  )
                : Image.asset(
                    "assets/images/camera.png",
                    width: 150,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickCamera,
        tooltip: 'Increment',
        child: Icon(Icons.camera),
      ),
    );
  }

  void _onClickCamera() async {
    PickedFile pickerFile = await picker.getImage(source: ImageSource.camera);
    if (pickerFile != null) {
      setState(() {
        this._file = File(pickerFile.path);
      });
    }
  }
}
