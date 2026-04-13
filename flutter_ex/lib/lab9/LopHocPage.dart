import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/lab9/LopHoc.dart';
import 'package:flutter_ex/lab9/SinhVienPage.dart';
import 'package:flutter_ex/lab9/SinhVienService.dart';

class LopHocPage extends StatefulWidget {
  const LopHocPage({super.key});

  @override
  State<LopHocPage> createState() => _LopHocPageState();
}

class _LopHocPageState extends State<LopHocPage> {
  final service = SinhVienService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách lớp")),
      body: FutureBuilder<List<LopHoc>>(
        future: service.findAllLopHoc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var list = snapshot.data!;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var lop = list[index];

              return Card(
                child: ListTile(
                  title: Text(lop.ten),
                  subtitle:
                  Text("Số SV: ${lop.sinhViens.length}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SinhVienPage(
                          lop: lop,
                          service: service,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}