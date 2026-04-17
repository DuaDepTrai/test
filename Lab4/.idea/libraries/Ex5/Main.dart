import 'dart:io';
import 'dart:convert';
import 'Book.dart';

void main() {

  List<Book> list = [];
  String? jsonData;

  while (true) {

    print("\n===== MENU =====");
    print("1. Nhap thong tin 5 Book");
    print("2. Hien thi danh sach Book");
    print("3. Export JSON");
    print("4. Import JSON");
    print("5. Thoat");

    stdout.write("Chon: ");
    String? choice = stdin.readLineSync();

    switch (choice) {

      case "1":

        list.clear();

        for (int i = 0; i < 5; i++) {

          print("\nNhap Book ${i + 1}");

          String isbn;
          while (true) {
            stdout.write("Nhap ISBN (>5): ");
            isbn = stdin.readLineSync() ?? "";
            if (isbn.length > 5) break;
            print("ISBN khong hop le!");
          }

          String name;
          while (true) {
            stdout.write("Nhap name (>5): ");
            name = stdin.readLineSync() ?? "";
            if (name.length > 5) break;
            print("Name khong hop le!");
          }

          double price;
          while (true) {
            stdout.write("Nhap price: ");
            String? input = stdin.readLineSync();
            double? value = double.tryParse(input ?? "");
            if (value != null) {
              price = value;
              break;
            }
            print("Price phai la so!");
          }

          String author;
          while (true) {
            stdout.write("Nhap author (>10): ");
            author = stdin.readLineSync() ?? "";
            if (author.length > 10) break;
            print("Author khong hop le!");
          }

          list.add(Book(isbn, name, price, author));
        }

        print("Nhap thanh cong 5 Book!");
        break;

      case "2":

        if (list.isEmpty) {
          print("Danh sach rong!");
        } else {
          for (var b in list) {
            b.hienThi();
          }
        }

        break;

      case "3":

        if (list.isEmpty) {
          print("Khong co du lieu!");
          break;
        }

        List<Map<String, dynamic>> jsonList =
        list.map((b) => b.toJSON()).toList();

        jsonData = jsonEncode(jsonList);

        print("\nJSON DATA:");
        print(jsonData);

        break;

      case "4":

        if (jsonData == null) {
          print("Chua co JSON de import!");
          break;
        }

        List data = jsonDecode(jsonData);

        List<Book> importList =
        data.map((e) => Book.fromJSON(e)).toList();

        print("\nDanh sach Book sau khi Import:");

        for (var b in importList) {
          b.hienThi();
        }

        break;

      case "5":
        print("Thoat chuong trinh.");
        return;

      default:
        print("Lua chon khong hop le!");
    }
  }
}