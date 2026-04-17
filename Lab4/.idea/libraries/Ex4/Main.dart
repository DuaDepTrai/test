import 'dart:io';

void main() {
  List<int> numbers = [];

  int sumEven = 0;
  int sumOdd = 0;

  for (int i = 0; i < 10; i++) {
    while (true) {
      stdout.write("Nhap so thu ${i + 1}: ");
      String? input = stdin.readLineSync();

      int? value = int.tryParse(input ?? "");

      if (value != null) {
        numbers.add(value);

        if (value % 2 == 0) {
          sumEven += value;
        } else {
          sumOdd += value;
        }

        break;
      } else {
        print("Gia tri phai la so! Vui long nhap lai.");
      }
    }
  }

  print("\n===== KET QUA =====");
  print("Tong cac so chan: $sumEven");
  print("Tong cac so le: $sumOdd");
}