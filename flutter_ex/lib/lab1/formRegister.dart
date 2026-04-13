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
          title: Text("REGISTER!"),
          actions: [
            Text("Hello USER_NAME"),
            IconButton(
                onPressed: () => {print("Hello USER_NAME")},
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
                Text("Password"),
                TextFormField(),

                SizedBox(height: 5,),
                Text("Re-Password"),
                TextFormField(),

                SizedBox(height: 5,),
                Text("Full Name"),
                TextFormField(),

                SizedBox(height: 5,),
                Text("Email"),
                TextFormField(),

                SizedBox(height: 5,),
                ElevatedButton(
                    onPressed: () {
                      print('Save at ${DateTime.now().toString()}');
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
