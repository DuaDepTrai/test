import 'dart:io';

int nhapSo(String tenBien) {
  while (true) {
    stdout.write('Nhap $tenBien: ');
    String? input = stdin.readLineSync();

    int? value = int.tryParse(input ?? '');

    if (value != null) {
      return value;
    } else {
      print('$tenBien phai la so! Vui long nhap lai.');
    }
  }
}

void main() {
  int a = nhapSo('a');
  int b = nhapSo('b');

  print('\n===== KET QUA =====');

  if (a == 0 && b == 0) {
    print('PT ${a}X + ${b} = 0 co vo so nghiem');
  } else if (a == 0 && b != 0) {
    print('PT ${a}X + ${b} = 0 vo nghiem');
  } else {
    double x = -b / a*1.0;

    if (x % 1 == 0) {
      print('PT ${a}X + ${b} = 0 co nghiem x = ${x.toInt()}');
    } else {
      print('PT ${a}X + ${b} = 0 co nghiem x = $x');
    }
  }
}