class PhuongTrinhBacNhat {
  double a;
  double b;

  PhuongTrinhBacNhat(this.a, this.b);

  String solve() {

    if (a == 0 && b == 0) {
      return "$a*X + $b = 0, vo so nghiem";
    }

    if (a == 0 && b != 0) {
      return "$a*X + $b = 0, vo nghiem";
    }

    double x = -b / a;

    return "$a*X + $b = 0, co nghiem, X = $x";
  }
}