import 'package:flutter/material.dart';

class ExerciseCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final double originalWidth = 600;
    final double originalHeight = 100;

    final double scaleX = size.width / originalWidth;
    final double scaleY = size.height / originalHeight;

    double x(double coord) => coord * scaleX;
    double y(double coord) => (coord + 100) * scaleY;

    path.moveTo(x(100), y(0));
    path.lineTo(x(150), y(0));
    path.lineTo(x(110), y(-27));
    path.lineTo(x(130), y(-27));
    path.lineTo(x(170), y(0));
    path.lineTo(x(190), y(0));
    path.lineTo(x(128), y(-45));
    path.lineTo(x(155), y(-45));
    path.lineTo(x(220), y(0));
    path.lineTo(x(600), y(0));
    path.lineTo(x(500), y(-100));
    path.lineTo(x(0), y(-100));

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
