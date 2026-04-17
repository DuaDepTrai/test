import 'dart:io';
import 'Employee.dart';

class ParttimeEmployee extends Employee {
  String _shift = '';

  ParttimeEmployee();

  ParttimeEmployee.full(String id, String name, String company, this._shift)
      : super.full(id, name, company);

  String get shift => _shift;
  set shift(String value) => _shift = value;

  @override
  void nhapThongTin() {
    super.nhapThongTin();

    stdout.write("Nhap Shift: ");
    _shift = stdin.readLineSync() ?? '';
  }

  @override
  void hienThongTin() {
    print("===== PARTTIME EMPLOYEE =====");
    super.hienThongTin();
    print("Shift: $_shift");
  }

  @override
  Map<String, dynamic> toJSON() {
    var json = super.toJSON();
    json["shift"] = _shift;
    return json;
  }

  @override
  void fromJSON(dynamic json) {
    super.fromJSON(json);
    _shift = json["shift"];
  }
}