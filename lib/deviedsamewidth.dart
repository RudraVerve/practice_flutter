import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Half-Half Layout'),
        ),
        body: Container(
          // Container to contain the row
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                // First child
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'First Child',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                // Second child
                child: Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Second Child',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
