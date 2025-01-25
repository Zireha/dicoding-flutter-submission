import 'package:flutter/material.dart';

enum AppColor {
  brown("Brown", Colors.brown);

  const AppColor(this.name, this.color);

  final String name;
  final Color color;
}