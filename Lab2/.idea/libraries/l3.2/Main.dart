import 'MobilePhone.dart';
import 'dart:io';

void main() {
  List<MobilePhone> list = [];

  while (true) {
    print('\n===== MENU =====');
    print('1. Nhap thong tin danh sach MobilePhone');
    print('2. Hien thi thong tin danh sach MobilePhone');
    print('3. Thoat');
    stdout.write('Chon: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        if (list.length >= 5) {
          print('Danh sach da du 5 MobilePhone!');
        } else {
          MobilePhone phone = MobilePhone();
          phone.nhapThongTin();
          list.add(phone);
          print('Them MobilePhone thanh cong!');
        }
        break;

      case '2':
        if (list.isEmpty) {
          print('Danh sach rong!');
        } else {
          for (int i = 0; i < list.length; i++) {
            print('\nMobilePhone ${i + 1}:');
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