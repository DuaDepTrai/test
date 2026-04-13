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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar demo"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.contact_mail),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ]),
          ),
          body: TabBarView(children: [
            Text("Home"),
            Text("Contact List"),
            Text("Settings"),
          ]),
        ));
  }
}
