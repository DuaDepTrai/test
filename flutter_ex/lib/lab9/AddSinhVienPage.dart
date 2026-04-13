import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab9/LopHoc.dart';
import 'package:flutter_ex/lab9/SinhVien.dart';
import 'package:flutter_ex/lab9/SinhVienService.dart';

class AddSinhVienPage extends StatelessWidget {
  final LopHoc lop;
  final SinhVienService service;

  AddSinhVienPage(
      {super.key, required this.lop, required this.service});

  final txtName = TextEditingController();
  final txtEmail = TextEditingController();

  void add(BuildContext context) async {
    var sv = SinhVien(txtName.text, txtEmail.text);

    var msg = await service.addNewSinhVien(lop, sv);

    if (msg != "OK") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg)));
      return;
    }

    Navigator.pop(context); // quay lại page 2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration:
              const InputDecoration(labelText: "Full name"),
            ),
            TextField(
              controller: txtEmail,
              decoration:
              const InputDecoration(labelText: "Email"),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => add(context),
                  child: const Text("OK"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}