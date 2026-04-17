import 'dart:io';
import 'dart:math';

void main(){
  print('Input name: ');
  String? name = stdin.readLineSync();
  if(name == null){
    print('Name cannot null');
    return;
  } else if(name.length <= 5 || name.length >= 20){
    print('Name invalid');
    return;
  }

  print('Input a:');
  int a = int.parse(stdin.readLineSync()!);
  if(a <= 0 || a >= 1000){
    print('Invalid a');
    return;
  }
  print('Input b:');
  int b = int.parse(stdin.readLineSync()!);
  if(b <= 0 || b >= 1000){
    print('Invalid b');
    return;
  }
  print('Input c:');
  int c = int.parse(stdin.readLineSync()!);
  if(c <= 0 || c >= 1000){
    print('Invalid c');
    return;
  }

  double d = b*b - 4*a*c*1.0;
  double x1, x2;
  String msg;
  if (d < 0){
    msg = '$name giai phuong trinh $a.X^2 + $b.X + $c = 0, phuong trinh vo nghiem';
  } else if (d == 0){
    x1 = -b/(2*a);
    msg = '$name giai phuong trinh $a.X^2 + $b.X + $c = 0, nghiem la: x1 = x2 = $x1';
  } else {
    x1 = (-b + sqrt(d))/(2*a);
    x2 = (-b - sqrt(d))/(2*a);
    msg = '$name giai phuong trinh $a.X^2 + $b.X + $c = 0, nghiem la: x1 = $x1, x2 = $x2';
  }

  print(msg);
}