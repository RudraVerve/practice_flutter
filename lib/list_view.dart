import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter"),
        ),
        body:ListView(
          // scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("one", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("two", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("three", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("four", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("five", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("six", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("one", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("two", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("three", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("four", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("five", style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("six", style: TextStyle(fontSize: 25),),
            ),
          ],
        )



    );
  }
}
