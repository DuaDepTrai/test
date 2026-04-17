import 'dart:io';
import 'PhuongTrinhBacHai.dart';

void main() {

  double a;
  double b;
  double c;

  while (true) {
    stdout.write("Nhap a: ");
    String? input = stdin.readLineSync();

    double? value = double.tryParse(input ?? "");

    if (value != null) {
      a = value;
      break;
    } else {
      print("a phai la number. Nhap lai!");
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
      print("b phai la number. Nhap lai!");
    }
  }

  while (true) {
    stdout.write("Nhap c: ");
    String? input = stdin.readLineSync();

    double? value = double.tryParse(input ?? "");

    if (value != null) {
      c = value;
      break;
    } else {
      print("c phai la number. Nhap lai!");
    }
  }

  PhuongTrinhBacHai pt = PhuongTrinhBacHai(a, b, c);

  print(pt.solve());
}