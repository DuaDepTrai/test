import 'dart:io';
import 'dart:math';

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

void main(){
  int a = nhapSo('a');
  int b = nhapSo('b');
  int c = nhapSo('c');

  double d = b*b - 4*a*c*1.0;
  double x1, x2;
  String msg;
  if (d < 0){
    msg = 'Phuong trinh $a.X^2 + $b.X + $c = 0, phuong trinh vo nghiem';
  } else if (d == 0){
    x1 = -b/(2*a);
    msg = 'Phuong trinh $a.X^2 + $b.X + $c = 0, nghiem la: x1 = x2 = $x1';
  } else {
    x1 = (-b + sqrt(d))/(2*a);
    x2 = (-b - sqrt(d))/(2*a);
    msg = 'Phuong trinh $a.X^2 + $b.X + $c = 0, nghiem la: x1 = $x1, x2 = $x2';
  }

  print(msg);
}