import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  var repository = UserRepository();

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var txtName = TextEditingController();
  var txtAddr = TextEditingController();
  var txtAge = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void doAddNew(BuildContext context) {
      if (formKey.currentState!.validate()) {
        var user = User(txtName.text, txtAge.text,
            int.parse(txtAge.text));
        if (widget.repository.kiemTraDaTonTai(user)) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      "User voi ten ${user.name} da ton tai")));
        } else {
          widget.repository.addNew(user);
          setState(() {
          });
          Navigator.pop(context);
        }
      }
  }
  void addNew(BuildContext context) {
    txtName.text = "";
    txtAddr.text = "";
    txtAge.text = "";

    showDialog(
        context: context,
        builder: (context) =>
            SimpleDialog(title: Text("Input User"), children: [
              SizedBox(
                  width: 400,
                  height: 300,
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
                         Row(
                           children: [
                             ElevatedButton(
                                 onPressed: () {
                                   txtName.text = "";
                                   txtAddr.text = "";
                                   txtAge.text = "";
                                   print('"set set text hehehehe');
                                 },
                                 child: Text("Reset")),
                             SizedBox(width: 10,),
                             ElevatedButton(
                                 onPressed: () => doAddNew(context),
                                 child: Text("Show it")),
                           ],
                         )
                        ],
                      )))
            ]));
  }

  @override
  Widget build(BuildContext context) {
    print('build build');
    var users = widget.repository.findAll();
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
          actions: [
            IconButton(
              onPressed: () => addNew(context),
              icon: Icon(Icons.add),
              color: Colors.red,
            )
          ],
        ),
        floatingActionButton: IconButton(
            onPressed: () => addNew(context),
            icon: Icon(Icons.add),
            color: Colors.green),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text("Name: ${user.name}"),
                  // subtitle:Text("Address: ${user.addr}"),
                  subtitle: ListView(
                    shrinkWrap: true,
                    children: [
                      Text("Address: ${user.addr}"),
                      Text("Age: ${user.age}"),
                    ],
                  ),
                ),
              );
            }));
  }
}

class User {
  String name;
  String addr;
  int age;

  User(this.name, this.addr, this.age);
}

class UserRepository {
  List<User> _users = [
    User("Tien Tung", "Ha Noi", 22),
    User("Tung Tien", "Ha Nam", 21),
  ];

  bool kiemTraDaTonTai(User user) {
    print('add new user: $user}');
    return _users.where((it) => it.name == user.name).isNotEmpty;
  }

  void addNew(User user) {
    print('add new user: $user}');
    _users.add(user);
  }

  List<User> findAll() {
    return _users;
  }
}
