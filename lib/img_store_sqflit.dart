import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'img_picker_helper/db_helper.dart';
import 'img_picker_helper/image_display.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Storage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final picker = ImagePicker();
  int _imageId = 0;

  Future<void> _pickAndStoreImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List imageBytes = await pickedFile.readAsBytes();
      int id = await DatabaseHelper.instance.insertImage(imageBytes);
      setState(() {
        _imageId = id;
      });
      print("Image stored with ID: $id");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Storage App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickAndStoreImage,
              child: Text("Pick and Store Image"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_imageId != 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDisplay(imageId: _imageId),
                    ),
                  );
                } else {
                  print("No image has been stored yet.");
                }
              },
              child: Text("Display Image"),
            ),
          ],
        ),
      ),
    );
  }
}
