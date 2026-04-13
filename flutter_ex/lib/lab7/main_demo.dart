import 'package:flutter/material.dart';

void main() {
  var congService = CongService();
  runApp(MaterialApp(
    routes: {
      "/": (_) => MyApp(),
      "/input": (_) => InputPage(congService),
      "/result": (_) => ResultPage(congService),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
      ),
      body: ListView(
        children: [
          Text("Home page"),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed("/input"),
              child: Text("Show Input Page")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed("/result"),
              child: Text("Show Result Page")),
        ],
      ),
    );
  }
}

class InputPage extends StatelessWidget {
  var txtA = TextEditingController();
  var txtB = TextEditingController();
  var formKey = GlobalKey<FormState>();
  CongService congService;

  InputPage(this.congService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input"),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Text("Input A, B value"),
              TextFormField(
                controller: txtA,
                decoration: InputDecoration(labelText: "A: "),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Phai nhap gia tri A";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: txtB,
                decoration: InputDecoration(labelText: "B: "),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Phai nhap gia tri B";
                  }

                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var cong = Cong(
                          a: int.parse(txtA.text), b: int.parse(txtB.text));
                      this.congService.add(cong);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add")),
            ],
          )),
    );
  }
}

class ResultPage extends StatelessWidget {
  CongService congService;

  ResultPage(this.congService);

  @override
  Widget build(BuildContext context) {
    var congList = congService.congList;
    return Scaffold(
        appBar: AppBar(
          title: Text("Input"),
        ),
        body: congList.isEmpty
            ? Text("No data")
            : ListView.builder(
                itemCount: congList.length,
                itemBuilder: (context, idx) {
                  var cong = congList[idx];
                  return ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Input A = ${cong.a}, B = ${cong.b}"),
                    subtitle: Text(cong.ketQua),
                  );
                }));
  }
}

class Cong {
  int a;
  int b;
  String ketQua = "Chua tinh";

  Cong({required this.a, required this.b});

  void tinh() {
    this.ketQua = "$a + $b = ${a + b}";
  }
}

class CongService {
  List<Cong> congList = [];

  void add(Cong cong) {
    cong.tinh();
    congList.add(cong);
  }
}
