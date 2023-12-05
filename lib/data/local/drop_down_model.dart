import 'package:flutter/material.dart';

class DropDownData {
  String title;
  dynamic code;
  Color? titleColor;

  DropDownData(this.title, this.code, this.titleColor);

  static enable() => DropDownData("dummy", 100000001, null);

  @override
  String toString() {
    // TODO: implement toString
    return title;
  }
}
