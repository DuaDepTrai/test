import 'dart:io';
import 'Phone.dart';

class MobilePhone extends Phone {
  int _numberOfSim = 0;

  int get numberOfSim => _numberOfSim;

  set numberOfSim(int value) => _numberOfSim = value;

  @override
  void nhapThongTin() {
    super.nhapThongTin(); // gọi nhập từ Phone

    while (true) {
      stdout.write('Nhap numberOfSim: ');
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
    super.hienThiThongTin();
    print('NumberOfSim: $_numberOfSim');
    print('----------------------');
  }
}