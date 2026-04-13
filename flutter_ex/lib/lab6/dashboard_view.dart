import 'package:flutter/material.dart';
import 'package:flutter_ex/lab6/dashboard.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  var soLuongPhanTuTren1Row = 2;

  DashboardValueService sv = DashboardValueService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: FutureBuilder(future: sv.items(), builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            // return LinearProgressIndicator();
            return Center(child: CircularProgressIndicator());
          }

          var itemList = snapshot.data!;
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: soLuongPhanTuTren1Row,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1),
              itemCount: itemList.length,
              itemBuilder: (context, index) => DashboardStack(
                onValueSelected: (val) {
                  print('Hhehehehe, da pick: ${val.textMessage}');
                },
                value: itemList[index],
              ));
        })
    );
  }
}
