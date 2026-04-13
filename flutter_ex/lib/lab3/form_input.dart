import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var txtName = TextEditingController();
  var txtAddr = TextEditingController();
  var txtAge = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Form"),
      ),
      body: Center(
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Full Name"),
                  controller: txtName,
                  validator: (txtValue) {
                    if (txtValue == null || txtValue.isEmpty) {
                      return "Phai nhap Name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Address"),
                  controller: txtAddr,
                  validator: (txtValue) {
                    if (txtValue == null || txtValue.isEmpty) {
                      return "Phai nhap Address";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Age"),
                  controller: txtAge,
                  validator: (txtValue) {
                    if (txtValue == null || txtValue.isEmpty) {
                      return "Phai nhap Age";
                    }
                    try {
                      int.parse(txtValue);
                      return null;
                    } catch (loi) {
                      return "Phai nhap age la number";
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      txtName.text = "";
                      txtAddr.text = "";
                      txtAge.text = "";
                      print('"set set text hehehehe');
                    },
                    child: Text("Reset")),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print(
                            'Hello ${txtName.text}, you are ${txtAge.text} year old, and living in ${txtAddr.text}');
                      }
                    },
                    child: Text("Show it")),
              ],
            )),
      ),
    );
  }
}
