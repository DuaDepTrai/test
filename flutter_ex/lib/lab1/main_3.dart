import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          actions: [
            Text("Hello USER_NAME"),
            IconButton(
                onPressed: () => {print("Hello kiu kiu iiii")},
                icon: Icon(Icons.email))
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("User Name"),
                TextFormField(),

                SizedBox(height: 5,),
                Text("Full Name"),
                TextFormField(),

                SizedBox(height: 5,),
                Text("Password"),
                TextFormField(),

                SizedBox(height: 5,),
                ElevatedButton(
                    onPressed: () {
                      print('Ok roi, click me at ${DateTime.now().toString()}');
                    },
                    child: Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
