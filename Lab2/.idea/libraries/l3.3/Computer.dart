import 'dart:io';

class Computer {
  String _name = '';
  String _model = '';
  String _os = '';
  double _price = 0;

  String get name => _name;
  String get model => _model;
  String get os => _os;
  double get price => _price;

  set name(String value) => _name = value;
  set model(String value) => _model = value;
  set os(String value) => _os = value;
  set price(double value) => _price = value;

  void nhapThongTin() {
    stdout.write('Nhap name: ');
    name = stdin.readLineSync() ?? '';

    stdout.write('Nhap model: ');
    model = stdin.readLineSync() ?? '';

    stdout.write('Nhap OS: ');
    os = stdin.readLineSync() ?? '';

    while (true) {
      stdout.write('Nhap price: ');
      String? input = stdin.readLineSync();
      double? value = double.tryParse(input ?? '');
      if (value != null && value > 0) {
        price = value;
        break;
      } else {
        print('Price khong hop le! Nhap lai.');
      }
    }
  }

  void hienThiThongTin() {
    print('Name  : $_name');
    print('Model : $_model');
    print('OS    : $_os');
    print('Price : $_price');
    print('----------------------');
  }
}