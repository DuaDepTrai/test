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
  State<StatefulWidget> createState()=> MyAppState();

}
class MyAppState extends State<MyApp> {

  var txtName = TextEditingController();
  var txtAddr = TextEditingController();
  var txtAge = TextEditingController();

  void addNew(BuildContext context) {
    txtName.text = "";
    txtAddr.text = "";
    txtAge.text = "";

    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("Input User"),
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Full Name"),
                  controller: txtName,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Address"),
                  controller: txtAddr,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Age"),
                  controller: txtAge,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          var user = User(txtName.text, txtAddr.text, int.parse(txtAge.text));
                          widget.repository.addNew(user);
                          // goi ham setState nay de run lai build()..
                          setState(() {

                          });
                          Navigator.pop(context);
                        },
                        child: Text("Show it")),
                  ],
                )
              ],
            ));
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

  void addNew(User user) {
    print('add new user: $user}');
    _users.add(user);
  }

  List<User> findAll() {
    return _users;
  }
}
