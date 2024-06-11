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
        body:SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.green,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      // width: 200,
                      color: Colors.orange,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.yellow,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.cyan,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.green,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.orange,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.yellow,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.cyan,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.orange,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.cyan,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 200,
                width: 200,
                color: Colors.grey,
              ),

            ],
          ),
        )



    );
  }
}
