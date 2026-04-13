import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab9/AddSinhVienPage.dart';
import 'package:flutter_ex/lab9/LopHoc.dart';
import 'package:flutter_ex/lab9/SinhVienService.dart';

class SinhVienPage extends StatefulWidget {
  final LopHoc lop;
  final SinhVienService service;

  const SinhVienPage(
      {super.key, required this.lop, required this.service});

  @override
  State<SinhVienPage> createState() => _SinhVienPageState();
}

class _SinhVienPageState extends State<SinhVienPage> {

  void goToAdd() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddSinhVienPage(
          lop: widget.lop,
          service: widget.service,
        ),
      ),
    ).then((_) {
      setState(() {}); // refresh list
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.lop.sinhViens;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lớp ${widget.lop.ten}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: goToAdd,
          )
        ],
      ),
      body: list.isEmpty
          ? const Center(child: Text("Chưa có sinh viên"))
          : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var sv = list[index];

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(sv.fullname),
            subtitle: Text(sv.email),
          );
        },
      ),
    );
  }
}