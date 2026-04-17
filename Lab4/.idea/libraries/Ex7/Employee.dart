import 'dart:io';
import 'IAction.dart';

class Employee implements IAction {
  String _id = '';
  String _fullName = '';
  String _companyName = '';

  Employee();

  Employee.full(this._id, this._fullName, this._companyName);

  String get id => _id;
  String get fullName => _fullName;
  String get companyName => _companyName;

  set id(String value) => _id = value;
  set fullName(String value) => _fullName = value;
  set companyName(String value) => _companyName = value;

  @override
  void nhapThongTin() {
    stdout.write("Nhap ID: ");
    _id = stdin.readLineSync() ?? '';

    stdout.write("Nhap Full Name: ");
    _fullName = stdin.readLineSync() ?? '';

    stdout.write("Nhap Company Name: ");
    _companyName = stdin.readLineSync() ?? '';
  }

  @override
  void hienThongTin() {
    print("ID: $_id");
    print("Full Name: $_fullName");
    print("Company: $_companyName");
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      "id": _id,
      "fullName": _fullName,
      "companyName": _companyName
    };
  }

  @override
  void fromJSON(dynamic json) {
    _id = json["id"];
    _fullName = json["fullName"];
    _companyName = json["companyName"];
  }
}