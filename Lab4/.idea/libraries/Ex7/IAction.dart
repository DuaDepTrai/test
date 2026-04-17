import 'dart:io';

abstract class IAction {
  void nhapThongTin();
  void hienThongTin();
  Map<String, dynamic> toJSON();
  void fromJSON(dynamic json);
}