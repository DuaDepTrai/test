import 'dart:io';
import 'Contact.dart';

void main() {
  List<Contact> list = [];

  while (true) {
    print('\n===== MENU =====');
    print('1. Nhap thong tin danh sach Contact');
    print('2. Hien thi thong tin danh sach Contact');
    print('3. Thoat');
    stdout.write('Chon: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        if (list.length >= 5) {
          print('Danh sach da du 5 Contact!');
        } else {
          Contact c = Contact();
          c.nhapThongTin();
          list.add(c);
          print('Them Contact thanh cong!');
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