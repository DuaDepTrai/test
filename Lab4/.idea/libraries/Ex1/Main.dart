import 'dart:io';
import 'PhuongTrinhBacNhat.dart';

void main() {
  double a;
  double b;

  while (true) {
    stdout.write("Nhap a: ");
    String? input = stdin.readLineSync();

    double? value = double.tryParse(input ?? "");

    if (value != null) {
      a = value;
      break;
    } else {
      print("a phai la so. Nhap lai!");
    }
  }

  while (true) {
    stdout.write("Nhap b: ");
    String? input = stdin.readLineSync();

    double? value = double.tryParse(input ?? "");

    if (value != null) {
      b = value;
      break;
    } else {
      print("b phai la so. Nhap lai!");
    }
  }

  PhuongTrinhBacNhat pt = PhuongTrinhBacNhat(a, b);

  print(pt.solve());
}