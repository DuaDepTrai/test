import 'dart:io';
import 'Computer.dart';
import 'ComputerManagement.dart';
import 'ComputerManagementImpl.dart';

void main() {
  List<Computer> list = [];
  ComputerManagement manager = ComputerManagementImpl();

  while (true) {
    print('\n===== MENU =====');
    print('1. Nhap thong tin danh sach Computer');
    print('2. Hien thi danh sach Computer');
    print('3. Tim kiem computer theo ten');
    print('4. Hien thi Computer co gia max');
    print('5. Hien thi Computer co gia min');
    print('6. Thoat');
    stdout.write('Chon: ');

    String? choice = stdin.readLineSync();

    switch (choice) {

      case '1':
        if (list.length >= 5) {
          print('Danh sach da du 5 Computer!');
        } else {
          Computer c = Computer();
          c.nhapThongTin();
          list.add(c);
          print('Them Computer thanh cong!');
        }
        break;

      case '2':
        if (list.isEmpty) {
          print('Danh sach rong!');
        } else {
          for (var c in list) {
            c.hienThiThongTin();
          }
        }
        break;

      case '3':
        stdout.write('Nhap ten can tim: ');
        String name = stdin.readLineSync() ?? '';
        List<Computer> result = manager.timKiemTheoTen(name, list);

        if (result.isEmpty) {
          print('Khong tim thay!');
        } else {
          print('Ket qua tim kiem:');
          for (var c in result) {
            c.hienThiThongTin();
          }
        }
        break;

      case '4':
        Computer? max = manager.layComputerCoPriceMax(list);
        if (max == null) {
          print('Danh sach rong!');
        } else {
          print('Computer co gia cao nhat:');
          max.hienThiThongTin();
        }
        break;

      case '5':
        Computer? min = manager.layComputerCoPriceMin(list);
        if (min == null) {
          print('Danh sach rong!');
        } else {
          print('Computer co gia thap nhat:');
          min.hienThiThongTin();
        }
        break;

      case '6':
        print('Thoat chuong trinh.');
        return;

      default:
        print('Lua chon khong hop le!');
    }
  }
}