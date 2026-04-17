import 'dart:io';

void main() {
  List<int> numbers = [];

  for (int i = 0; i < 10; i++) {
    while (true) {
      stdout.write("Nhap so thu ${i + 1}: ");
      String? input = stdin.readLineSync();

      int? value = int.tryParse(input ?? "");

      if (value != null) {
        numbers.add(value);
        break;
      } else {
        print("Gia tri phai la so! Nhap lai.");
      }
    }
  }

  int min = numbers[0];
  int max = numbers[0];

  for (int n in numbers) {
    if (n < min) min = n;
    if (n > max) max = n;
  }

  int? evenMin;
  int? evenMax;

  int? oddMin;
  int? oddMax;

  for (int n in numbers) {
    if (n % 2 == 0) {
      if (evenMin == null || n < evenMin) {
        evenMin = n;
      }

      if (evenMax == null || n > evenMax) {
        evenMax = n;
      }
    } else {
      if (oddMin == null || n < oddMin) {
        oddMin = n;
      }

      if (oddMax == null || n > oddMax) {
        oddMax = n;
      }
    }
  }

  print("\n===== KET QUA =====");
  print("Min: $min");
  print("Max: $max");

  print("\nSo chan:");
  print("Chan nho nhat: ${evenMin ?? "Khong co"}");
  print("Chan lon nhat: ${evenMax ?? "Khong co"}");

  print("\nSo le:");
  print("Le nho nhat: ${oddMin ?? "Khong co"}");
  print("Le lon nhat: ${oddMax ?? "Khong co"}");
}