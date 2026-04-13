import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void showSimpleDialogHerhehe(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Hien thong tin"),
            children: [
              Text("Hien thi thong tin day du day roi"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {
                    print('bye....');
                    Navigator.pop(context);
                  }, child: Text("OK Roi")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: () {
                    print('bye11111....');
                    Navigator.pop(context);
                  }, child: Text("Cancel"))
                ],
              )
            ],
          );
        });
  }
  void showAlertDialogDiHeheh(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // SimpleDialog
          return AlertDialog(
            title: Text("Hien thong tin"),
            content: Center(
              child: Text("Hien thi thong tin day du day roi"),
            ),
            actions: [
              ElevatedButton(onPressed: () {
                print('bye....');
                Navigator.pop(context);
                  }, child: Text("OK Roi")),
              ElevatedButton(onPressed: () {
                print('bye11111....');
                Navigator.pop(context);
                  }, child: Text("Cancel"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              // onPressed: () => showAlertDialogDiHeheh(context),
              onPressed: () => showSimpleDialogHerhehe(context),
              child: Text("Show Dialog")),
        ],
      ),
    );
  }
}
