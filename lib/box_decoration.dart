import 'package:flutter/material.dart';
void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'box_decoration tut.',
      theme: ThemeData(primarySwatch:Colors.grey),
      home: myhome(),
    );
  }
}

class  myhome extends StatelessWidget {
  const myhome ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Box_Decoration"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 3
            ),
              image: DecorationImage(
              image: NetworkImage('assets/image/toy1.png'),
                  fit: BoxFit.fill,

          ),
            boxShadow:[
              BoxShadow(
                color: Colors.green,
                spreadRadius: 2,
                blurRadius: 10
              )
            ],

            )
          ),
        ),
      );
  }
}


