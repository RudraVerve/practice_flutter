import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_practice_1/img_picker_helper/db_helper.dart';

class ImageDisplay extends StatelessWidget {
  final int imageId;

  ImageDisplay({required this.imageId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image'),
        backgroundColor: Colors.deepPurple, // Optional: Add custom color
      ),
      body: Center(
        child: FutureBuilder<Uint8List?>(
          future: DatabaseHelper.instance.getImage(imageId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Loading indicator
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data != null) {
                return Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                  width: 300, // Specify a width
                  height: 300, // Specify a height
                );
              } else {
                return Text(
                  "No image found with ID $imageId",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                );
              }
            } else {
              return Text(
                "Error loading image",
                style: TextStyle(fontSize: 18, color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }
}
