import 'package:flutter/painting.dart';

class AppShadows {
  static const List<BoxShadow> labelShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.4),
      blurRadius: 4,
      spreadRadius: 0,
      offset: Offset(0, -2),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.3),
      blurRadius: 13,
      spreadRadius: -3,
      offset: Offset(0, -7),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      blurRadius: 0,
      spreadRadius: 0,
      offset: Offset(0, 3),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 1.0),
      blurRadius: 0,
      spreadRadius: 0,
      offset: Offset(0, 0),
    ),
  ];

  static const List<BoxShadow> descriptionlabelShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      blurRadius: 14,
      spreadRadius: 0,
      offset: Offset(0, -14),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.22),
      blurRadius: 5,
      spreadRadius: 0,
      offset: Offset(0, -10),
    ),
  ];
}
