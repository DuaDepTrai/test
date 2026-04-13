import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack"),),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
            width: 150,
            height: 120,
            child: Image.asset("message.webp"),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
            width: 150,
            height: 120,
            child: Text("Thong bao day",),
          )
        ],
      )
    );
  }

}