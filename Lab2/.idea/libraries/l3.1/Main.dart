import 'Contact.dart';
import 'dart:io';

void main() {
  List<Contact> list = [];

  while (true) {
    print('\n===== MENU =====');
    print('1. Nhap thong tin danh sach contact');
    print('2. Hien thi danh sach contact');
    print('3. Thoat');
    stdout.write('Chon: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        if (list.length >= 5) {
          print('Danh sach da du 5 contact!');
        } else {
          Contact c = Contact();
          c.nhapThongTin();
          list.add(c);
          print('Them contact thanh cong!');
        }
        break;

      case '2':
        if (list.isEmpty) {
          print('Danh sach rong!');
        } else {
          for (int i = 0; i < list.length; i++) {
            print('\nContact ${i + 1}:');
            list[i].hienThiThongTin();
          }
        }
        break;

      case '3':
        print('Thoat chuong trinh.');
        return;

      default:
        print('Lua chon khong hop le!');
    }
  }
}