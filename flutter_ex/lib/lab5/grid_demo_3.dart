import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  var soLuongPhanTuTren1Row = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: soLuongPhanTuTren1Row,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 1),
          children: [
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
            MyStack(imgName: "message.webp", textMessage: "Thong bao 1"),
          ],
        ));
  }
}

class MyStack extends StatelessWidget {
  String imgName;

  String textMessage;

  MyStack({required this.imgName, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
          width: 150,
          height: 120,
          child: Image.asset(imgName),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
          width: 150,
          height: 120,
          child: Text(textMessage),
        )
      ],
    );
  }
}
