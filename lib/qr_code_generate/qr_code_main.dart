import 'package:flutter/material.dart';                // Flutter's material design library
import 'package:flutter_practice_1/qr_code_generate/qr_display.dart';                  // Import the screen to display QR codes

void main() {
  runApp(MyApp());                                    // Run the MyApp widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code App',                            // Set the title of the app
      theme: ThemeData(
        primarySwatch: Colors.blue,                   // Set the primary color for the app
      ),
      home: QrCodeListScreen(),                       // Set the home screen to the QR code list screen
    );
  }
}
