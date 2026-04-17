import 'dart:math';

class PhuongTrinhBacHai {
  double a;
  double b;
  double c;

  PhuongTrinhBacHai(this.a, this.b, this.c);

  String solve() {

    if (a == 0) {
      return "Day khong phai phuong trinh bac hai";
    }

    double delta = b * b - 4 * a * c;

    if (delta < 0) {
      return "${a}X^2 + ${b}X + ${c} = 0, phuong trinh vo nghiem";
    }

    if (delta == 0) {
      double x = -b / (2 * a);
      return "${a}X^2 + ${b}X + ${c} = 0, phuong trinh co nghiem kep X = $x";
    }

    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);

    return "${a}X^2 + ${b}X + ${c} = 0, co 2 nghiem, X1 = $x1, X2 = $x2";
  }
}