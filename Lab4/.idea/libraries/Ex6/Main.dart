import 'dart:io';
import 'dart:convert';

import 'PhuongTrinhBacNhat.dart';

void main() {

  print("Nhap JSON:");
  String jsonInput = stdin.readLineSync() ?? "";

  try {

    List data = jsonDecode(jsonInput);

    List<PhuongTrinhBacNhat> list = [];

    for (var item in data) {

      var a = item["a"];
      var b = item["b"];

      if (a is num && b is num) {

        list.add(
            PhuongTrinhBacNhat(
                a.toDouble(),
                b.toDouble()
            )
        );

      } else {
        print("Gia tri a hoac b khong phai la number!");
      }
    }

    print("\n===== KET QUA =====");

    for (var pt in list) {
      print(pt.solve());
    }

  } catch (e) {
    print("JSON khong hop le!");
  }

}