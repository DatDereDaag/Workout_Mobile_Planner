import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;

  const Button({super.key, required this.text});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      alignment: Alignment.center,
      height: 50,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadows.buttonShadow,
        color: AppColors.primaryColor,
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'ExpletusSans',
        ),
      ),
    );
  }
}
