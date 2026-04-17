import 'dart:io';

class Contact {
  String _phoneNo = '';
  String _email = '';
  String _fullName = '';
  int _age = 0;

  String get phoneNo => _phoneNo;
  String get email => _email;
  String get fullName => _fullName;
  int get age => _age;

  set phoneNo(String value) {
    _phoneNo = value;
  }

  set email(String value) {
    _email = value;
  }

  set fullName(String value) {
    _fullName = value;
  }

  set age(int value) {
    _age = value;
  }

  void nhapThongTin() {
    while (true) {
      stdout.write('Nhap phone (10 so): ');
      String? input = stdin.readLineSync();

      if (input != null && input.length == 10) {
        phoneNo = input;
        break;
      } else {
        print('Phone khong hop le! Nhap lai.');
      }
    }

    while (true) {
      stdout.write('Nhap full name (>5 ky tu): ');
      String? input = stdin.readLineSync();

      if (input != null && input.length > 5) {
        fullName = input;
        break;
      } else {
        print('Full name khong hop le! Nhap lai.');
      }
    }

    while (true) {
      stdout.write('Nhap email (>5 ky tu): ');
      String? input = stdin.readLineSync();

      if (input != null && input.length > 5) {
        email = input;
        break;
      } else {
        print('Email khong hop le! Nhap lai.');
      }
    }

    while (true) {
      stdout.write('Nhap age (>15): ');
      String? input = stdin.readLineSync();
      int? value = int.tryParse(input ?? '');

      if (value != null && value > 15) {
        age = value;
        break;
      } else {
        print('Age khong hop le! Nhap lai.');
      }
    }
  }

  void hienThiThongTin() {
    print('------ CONTACT ------');
    print('Phone   : $_phoneNo');
    print('Name    : $_fullName');
    print('Email   : $_email');
    print('Age     : $_age');
    print('---------------------');
  }
}