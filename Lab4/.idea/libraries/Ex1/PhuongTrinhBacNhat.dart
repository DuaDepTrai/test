class PhuongTrinhBacNhat {
  double a;
  double b;

  PhuongTrinhBacNhat(this.a, this.b);

  String solve() {
    if (a == 0 && b == 0) {
      return "${a}X + ${b} = 0, phương trình có vô số nghiệm";
    }

    if (a == 0 && b != 0) {
      return "${a}X + ${b} = 0, phương trình vô nghiệm";
    }

    double x = -b / a;
    return "${a}X + ${b} = 0, có nghiệm X = $x";
  }
}