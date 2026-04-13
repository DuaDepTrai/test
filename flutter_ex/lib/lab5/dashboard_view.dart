import 'package:flutter/material.dart';
import 'package:flutter_ex/lab5/dashboard.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  var soLuongPhanTuTren1Row = 2;

  DashboardValueService sv = DashboardValueService();

  @override
  Widget build(BuildContext context) {
    var dashboardItems = sv.items();
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: soLuongPhanTuTren1Row,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1),
            itemCount: dashboardItems.length,
            itemBuilder: (context, index) => DashboardStack(
              onValueSelected: (val) {
                print('Hhehehehe, da pick: ${val.textMessage}');
                  },
                  value: dashboardItems[index],
                )));
  }
}
