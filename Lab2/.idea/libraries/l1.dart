import 'dart:io';

void nhapThongTin(Map<String, String> data) {
  while (true) {
    stdout.write('Nhap phone (10 so): ');
    String? phone = stdin.readLineSync();

    if (phone != null && phone.length == 10) {
      data['phoneNo'] = phone;
      break;
    } else {
      print('Phone khong hop le! Vui long nhap lai.');
    }
  }

  while (true) {
    stdout.write('Nhap full name (>5 ky tu): ');
    String? name = stdin.readLineSync();

    if (name != null && name.length > 5) {
      data['fullName'] = name;
      break;
    } else {
      print('Full name khong hop le! Vui long nhap lai.');
    }
  }

  while (true) {
    stdout.write('Nhap email (>5 ky tu): ');
    String? email = stdin.readLineSync();

    if (email != null && email.length > 5) {
      data['email'] = email;
      break;
    } else {
      print('Email khong hop le! Vui long nhap lai.');
    }
  }

  while (true) {
    stdout.write('Nhap age (>15): ');
    String? ageInput = stdin.readLineSync();

    int? age = int.tryParse(ageInput ?? '');

    if (age != null && age > 15) {
      data['age'] = age.toString();
      break;
    } else {
      print('Age khong hop le! Vui long nhap lai.');
    }
  }
}

void hienThiThongTin(Map<String, String> data) {
  print('------ CONTACT ------');
  print('Phone   : ${data['phoneNo']}');
  print('Name    : ${data['fullName']}');
  print('Email   : ${data['email']}');
  print('Age     : ${data['age']}');
  print('---------------------');
}

void main() {
  List<Map<String, String>> list = [];

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
          Map<String, String> contact = {};
          nhapThongTin(contact);
          list.add(contact);
          print('Them contact thanh cong!');
        }
        break;

      case '2':
        if (list.isEmpty) {
          print('Danh sach rong!');
        } else {
          for (int i = 0; i < list.length; i++) {
            print('\nContact ${i + 1}:');
            hienThiThongTin(list[i]);
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