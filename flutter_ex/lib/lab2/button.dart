import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button"),),
      body: ListView(
        children: [
          TextButton(onPressed: null, child: Text("Disabled Text button")),
          ElevatedButton(onPressed: () {
            print('Hello ElevatedButton');
              }, child: Text("ElevatedButton")),
          IconButton(onPressed: () {
            print('Hello IconButton...');
              }, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}