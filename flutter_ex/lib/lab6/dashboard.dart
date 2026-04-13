import 'dart:ui';

import 'package:flutter/material.dart';

class DashboardValue {
  Color borderColor;
  Image image;
  String textMessage;
  DashboardValue({required this.image, required this.borderColor, required this.textMessage});
}


typedef OnDashboardValueSelect = void Function(DashboardValue);

class DashboardStack extends StatelessWidget {
  DashboardValue  value;
  OnDashboardValueSelect onValueSelected;
  DashboardStack({required this.value, required this.onValueSelected});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Stack(
        children: [
          Container(
              decoration:
              BoxDecoration(border: Border.all(width: 2, color: value.borderColor)),
              width: 150,
              height: 120,
              child: value.image
              // child: Placeholder()
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 150,
            height: 120,
            child: Text(value.textMessage),
          )
        ],
      ),
      onTap: ()  => onValueSelected(value),
    );
  }
}


class DashboardValueService {
  List<DashboardValue> _items = [
    DashboardValue(borderColor: Colors.red, image: Image.asset("message.webp"), textMessage: "All message"),
    DashboardValue(borderColor: Colors.green, image: Image.asset("message.webp"), textMessage: "Read message"),
    DashboardValue(borderColor: Colors.blue, image: Image.asset("message.webp"), textMessage: "UnRead message"),
    DashboardValue(borderColor: Colors.yellow, image: Image.asset("message.webp"), textMessage: "Draft message"),
  ];

  Future<List<DashboardValue>> items() {
    return Future.delayed(Duration(seconds: 10), () => _items);
  }
}