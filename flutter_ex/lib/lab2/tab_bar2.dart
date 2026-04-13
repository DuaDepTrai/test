import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Tab> generateTab() {
    return [
      Tab(
        icon: Icon(Icons.home),
      ),
      Tab(
        icon: Icon(Icons.contact_mail),
      ),
      Tab(
        icon: Icon(Icons.settings),
      ),
    ];
  }

  Widget generateHomeView(){
    return Center(
      child: Text("Home page here"),
    );
  }Widget generateContactView(){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 100,
        child: ListTile(
          leading: Image.asset("avatar.jfif", height: 100, width: 60,),
          title: Text("Name: Tran Tien Anh"),
          // subtitle: Column(
          subtitle: ListView(
            children: [
              Text("Age: 22"),
              Text("Email: tien@anh.com"),
              Text("Address: Ha Noi, Viet Nam"),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateSettingView(){
    return Center(
      child: Icon(Icons.settings_accessibility),
    );
  }
  @override
  Widget build(BuildContext context) {
    var tabList = generateTab();
    return DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar demo"),
            bottom: TabBar(tabs: tabList),
          ),
          body: TabBarView(children: [
            generateHomeView(),
            generateContactView(),
            generateSettingView(),
          ]),
        ));
  }
}
