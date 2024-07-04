import 'dart:typed_data'; // For byte data
import 'dart:ui' as ui; // For image data
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; // For directory path
import 'package:flutter/rendering.dart'; // For capturing the widget as image
import 'package:image_gallery_saver/image_gallery_saver.dart'; // For saving image to gallery
import 'package:permission_handler/permission_handler.dart'; // For requesting permissions

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Download Container as Image'),
        ),
        body: CaptureImageScreen(),
      ),
    );
  }
}

class CaptureImageScreen extends StatefulWidget {
  @override
  _CaptureImageScreenState createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _captureAndSave() async {
    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        print('Storage permission not granted');
        return;
      }

      // Capture the image
      RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save the image to the gallery
      final result = await ImageGallerySaver.saveImage(pngBytes, name: "container_image");
      print('Image saved to gallery: $result');
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Capture Me',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _captureAndSave,
            child: Text('Capture and Save to Gallery'),
          ),
        ],
      ),
    );
  }
}
