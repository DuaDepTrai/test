import 'dart:io';
import 'Computer.dart';
import 'ComputerManagement.dart';

class ComputerManagementImpl implements ComputerManagement {

  @override
  List<Computer> timKiemTheoTen(String computerName, List<Computer> list) {
    return list
        .where((c) => c.name.toLowerCase().contains(computerName.toLowerCase()))
        .toList();
  }

  @override
  Computer? layComputerCoPriceMax(List<Computer> list) {
    if (list.isEmpty) return null;

    Computer max = list[0];
    for (var c in list) {
      if (c.price > max.price) {
        max = c;
      }
    }
    return max;
  }

  @override
  Computer? layComputerCoPriceMin(List<Computer> list) {
    if (list.isEmpty) return null;

    Computer min = list[0];
    for (var c in list) {
      if (c.price < min.price) {
        min = c;
      }
    }
    return min;
  }
}