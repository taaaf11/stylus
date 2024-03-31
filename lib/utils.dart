import 'package:flutter/material.dart';

int getCrossAxisCount(double width) {
  switch (width) {
    case < 320:
    case >= 320 && <= 767:
      return 1;
    case >= 768 && <= 991:
      return 2;
    case >= 992:
      return 3;
    default:
      return 2;
  }
}

Axis getAxis(double width) {
  return (width < 500) ? Axis.vertical : Axis.horizontal;
}
