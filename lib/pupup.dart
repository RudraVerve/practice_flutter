import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the dialog when the button is pressed
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Popup Title'),
                  content: Text('This is the content of the popup.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Close the dialog when the "Close" button is pressed
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Show Popup'),
        ),
      ),
    );
  }
}
