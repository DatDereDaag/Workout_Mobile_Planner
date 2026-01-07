import 'package:flutter/material.dart';

class ExerciseCardClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final double originalWidth = 470;
    final double originalHeight = 427;

    final double scaleX = size.width / originalWidth;
    final double scaleY = size.height / originalHeight;

    double x(double coord) => coord * scaleX;
    double y(double coord) => coord * scaleY;

    path.moveTo(x(0), y(427));
    path.relativeLineTo(x(55), 0);
    path.cubicTo(x(70), y(393.667), x(90), y(360.333), x(110), y(327));
    path.lineTo(x(200), y(327));
    path.relativeLineTo(0, y(20));
    path.lineTo(x(120), y(347));
    path.lineTo(x(78), y(427));
    path.lineTo(x(100), y(427));
    path.lineTo(x(130), y(367));
    path.lineTo(x(220), y(367));
    path.lineTo(x(220), y(387));
    path.lineTo(x(140), y(387));
    path.lineTo(x(120), y(427));
    path.lineTo(x(290), y(427));
    path.cubicTo(x(350), y(287), x(410), y(147), x(470), y(7));
    path.lineTo(x(200), y(7));
    path.lineTo(x(180), y(47));
    path.lineTo(x(240), y(47));
    path.lineTo(x(230), y(67));
    path.lineTo(x(170), y(67));
    path.lineTo(x(160), y(87));
    path.lineTo(x(270), y(87));
    path.lineTo(x(260), y(107));
    path.lineTo(x(160), y(107));
    path.lineTo(x(140), y(147));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ExerciseCardClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final double originalWidth = 470;
    final double originalHeight = 427;

    final double scaleX = size.width / originalWidth;
    final double scaleY = size.height / originalHeight;

    double x(double coord) => coord * scaleX;
    double y(double coord) => coord * scaleY;

    path.moveTo(x(0), y(427));
    path.relativeLineTo(x(55), 0);
    path.cubicTo(x(70), y(393.667), x(90), y(360.333), x(110), y(327));
    path.lineTo(x(120), y(347));
    path.lineTo(x(78), y(427));
    path.lineTo(x(100), y(427));
    path.lineTo(x(130), y(367));
    path.lineTo(x(140), y(387));
    path.lineTo(x(120), y(427));
    path.lineTo(x(290), y(427));
    path.cubicTo(x(350), y(287), x(410), y(147), x(470), y(7));
    path.lineTo(x(200), y(7));
    path.lineTo(x(180), y(47));
    path.lineTo(x(241), y(47));
    path.lineTo(x(295), y(15));
    path.lineTo(x(329), y(15));
    path.lineTo(x(250), y(67));
    path.lineTo(x(170), y(67));
    path.lineTo(x(160), y(87));
    path.lineTo(x(270), y(87));
    path.lineTo(x(346), y(33));
    path.lineTo(x(382), y(33));
    path.lineTo(x(283), y(107));
    path.lineTo(x(253), y(107));
    path.lineTo(x(160), y(107));
    path.lineTo(x(140), y(147));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
