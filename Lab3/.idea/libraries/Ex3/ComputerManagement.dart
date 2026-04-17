import 'Computer.dart';

abstract class ComputerManagement {
  List<Computer> timKiemTheoTen(String computerName, List<Computer> list);

  Computer? layComputerCoPriceMax(List<Computer> list);

  Computer? layComputerCoPriceMin(List<Computer> list);
}