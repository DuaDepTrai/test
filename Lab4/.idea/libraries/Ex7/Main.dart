import 'dart:io';
import 'dart:convert';
import 'Employee.dart';
import 'FullTimeEmployee.dart';
import 'ParttimeEmployee.dart';

void main() {

  FullTimeEmployee full = FullTimeEmployee();
  ParttimeEmployee part = ParttimeEmployee();

  while (true) {

    print("\n===== MENU =====");
    print("1. Nhap thong tin");
    print("2. Hien thi thong tin");
    print("3. Import JSON");
    print("4. Print JSON");
    print("5. Thoat");

    stdout.write("Chon: ");
    String choice = stdin.readLineSync() ?? '';

    switch (choice) {

      case "1":
        print("\nNhap FullTimeEmployee");
        full.nhapThongTin();

        print("\nNhap ParttimeEmployee");
        part.nhapThongTin();
        break;

      case "2":
        full.hienThongTin();
        part.hienThongTin();
        break;

      case "3":
        print("Nhap JSON:");
        String jsonStr = stdin.readLineSync() ?? '';

        var jsonData = jsonDecode(jsonStr);

        if (jsonData["type"] == "full") {
          full.fromJSON(jsonData);
          full.hienThongTin();
        } else {
          part.fromJSON(jsonData);
          part.hienThongTin();
        }

        break;

      case "4":
        print("FullTime JSON:");
        print(jsonEncode(full.toJSON()));

        print("PartTime JSON:");
        print(jsonEncode(part.toJSON()));
        break;

      case "5":
        return;

      default:
        print("Lua chon khong hop le!");
    }
  }
}