import 'dart:typed_data';
import 'package:flutter/material.dart';           // Flutter's material design library
import 'package:flutter_practice_1/qr_code_generate/qr_db_helper.dart';
import 'package:flutter_practice_1/qr_code_generate/qr_generate.dart';

class QrCodeListScreen extends StatefulWidget {
  @override
  _QrCodeListScreenState createState() => _QrCodeListScreenState();   // Create the state for the screen
}

class _QrCodeListScreenState extends State<QrCodeListScreen> {
  late Future<List<Map<String, dynamic>>> qrCodes;  // Declare a future list to hold QR code data

  @override
  void initState() {
    super.initState();
    qrCodes = DatabaseHelper().getQrCodes();        // Initialize the QR codes future
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Codes'),                    // Set the title of the app bar
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: qrCodes,                            // Pass the future of QR codes to the FutureBuilder
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show a loading indicator while waiting
          } else if (snapshot.hasData) {
            final qrCodesList = snapshot.data!;      // Get the list of QR codes
            return ListView.builder(
              itemCount: qrCodesList.length,         // Set the item count to the number of QR codes
              itemBuilder: (context, index) {
                final qrCodeData = qrCodesList[index]; // Get the current QR code data
                final imageBytes = qrCodeData['image'] as Uint8List; // Get the image bytes

                return ListTile(
                  title: Text(qrCodeData['data']),   // Display the data associated with the QR code
                  leading: Image.memory(imageBytes, width: 50, height: 50), // Display the QR code image
                );
              },
            );
          } else {
            return Center(child: Text('No QR codes available')); // Show a message if no QR codes are available
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await generateAndStoreQrCode('Some unique data'); // Generate and store a QR code
          setState(() {
            qrCodes = DatabaseHelper().getQrCodes();       // Refresh the list of QR codes
          });
        },
        child: Icon(Icons.add),                            // Set the icon for the floating action button
      ),
    );
  }
}
