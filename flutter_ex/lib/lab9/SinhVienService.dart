import 'package:flutter_ex/lab9/LopHoc.dart';
import 'package:flutter_ex/lab9/SinhVien.dart';

class SinhVienService {
  final List<LopHoc> _lopHocs = [
    LopHoc("CNTT1", [
      SinhVien("Nguyen Van A", "a@gmail.com"),
      SinhVien("Tran Van B", "b@gmail.com"),
    ]),
    LopHoc("CNTT2", [
      SinhVien("Le Van C", "c@gmail.com"),
    ]),
  ];

  Future<List<LopHoc>> findAllLopHoc() async {
    await Future.delayed(const Duration(seconds: 1));
    return _lopHocs;
  }

  Future<String> addNewSinhVien(LopHoc lop, SinhVien sv) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // validate duplicate email
    if (lop.sinhViens.any((s) => s.email == sv.email)) {
      return "Email đã tồn tại";
    }

    lop.sinhViens.add(sv);
    return "OK";
  }
}