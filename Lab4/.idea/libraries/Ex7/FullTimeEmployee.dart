import 'dart:io';
import 'Employee.dart';

class FullTimeEmployee extends Employee {
  String _position = '';

  FullTimeEmployee();

  FullTimeEmployee.full(String id, String name, String company, this._position)
      : super.full(id, name, company);

  String get position => _position;
  set position(String value) => _position = value;

  @override
  void nhapThongTin() {
    super.nhapThongTin();

    stdout.write("Nhap Position: ");
    _position = stdin.readLineSync() ?? '';
  }

  @override
  void hienThongTin() {
    print("===== FULLTIME EMPLOYEE =====");
    super.hienThongTin();
    print("Position: $_position");
  }

  @override
  Map<String, dynamic> toJSON() {
    var json = super.toJSON();
    json["position"] = _position;
    return json;
  }

  @override
  void fromJSON(dynamic json) {
    super.fromJSON(json);
    _position = json["position"];
  }
}