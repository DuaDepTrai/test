import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String name;
  final int age;
  final String email;
  final String address;

  User({
    required this.name,
    required this.age,
    required this.email,
    required this.address,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void showUserDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Age: ${user.age}"),
              Text("Email: ${user.email}"),
              Text("Address: ${user.address}"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      User(
          name: "Tran Tien Anh",
          age: 22,
          email: "tien@anh.com",
          address: "Ha Noi"),
      User(
          name: "Nguyen Van A",
          age: 25,
          email: "vana@gmail.com",
          address: "Da Nang"),
      User(
          name: "Le Thi B",
          age: 30,
          email: "b@gmail.com",
          address: "Ho Chi Minh"),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Profiles"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];

            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(user.name),
              subtitle: Text(user.email),
              onTap: () => showUserDialog(context, user),
            );
          },
        ),
      ),
    );
  }
}