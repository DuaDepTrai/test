import 'Phone.dart';
import 'dart:io';

class MobilePhone extends Phone {
  int _numberOfSim = 0;

  int get numberOfSim => _numberOfSim;
  set numberOfSim(int value) => _numberOfSim = value;

  @override
  void nhapThongTin() {
    super.nhapThongTin();

    while (true) {
      stdout.write('Nhap number of SIM: ');
      String? input = stdin.readLineSync();
      int? value = int.tryParse(input ?? '');
      if (value != null && value > 0) {
        numberOfSim = value;
        break;
      } else {
        print('So SIM khong hop le! Nhap lai.');
      }
    }
  }

  @override
  void hienThiThongTin() {
    print('===== MOBILE PHONE =====');
    super.hienThiThongTin();
    print('Number of SIM: $_numberOfSim');
    print('========================');
  }
}