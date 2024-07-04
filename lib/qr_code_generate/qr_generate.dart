import 'dart:typed_data';                              // Provides support for lists of bytes
import 'dart:ui';                                      // Provides Flutter's low-level painting API
import 'package:flutter/material.dart';                // Flutter's material design library
import 'package:flutter_practice_1/qr_code_generate/qr_db_helper.dart';
import 'package:qr_flutter/qr_flutter.dart';           // Library to generate QR codes
import 'package:image/image.dart' as img;              // Library for image manipulation

Future<void> generateAndStoreQrCode(String data) async {
  final qrValidationResult = QrValidator.validate(
    data: data,                                        // Data to encode in the QR code
    version: QrVersions.auto,                          // Automatically choose the QR code version
    errorCorrectionLevel: QrErrorCorrectLevel.L,       // Error correction level
  );

  if (qrValidationResult.status == QrValidationStatus.valid) {
    final qrCode = qrValidationResult.qrCode;          // Get the generated QR code
    final painter = QrPainter.withQr(
      qr: qrCode!,                                     // Use the generated QR code
      color: const Color(0xFF000000),                  // QR code color
      gapless: true,                                   // Avoid gaps between the QR code modules
    );

    final image = await painter.toImage(300);          // Convert the QR code to an image
    final byteData = await image.toByteData(format: ImageByteFormat.png);  // Get the image as byte data

    final imageBytes = byteData!.buffer.asUint8List(); // Convert the byte data to a list of bytes

    final dbHelper = DatabaseHelper();                 // Create an instance of the database helper
    await dbHelper.insertQrCode(data, imageBytes);     // Insert the QR code data and image into the database
  } else {
    print("Invalid QR code data");                     // Print an error message if the QR code data is invalid
  }
}
