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
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadows.buttonShadow,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.buttonColor.withValues(alpha: 1),
            AppColors.buttonColor2.withValues(alpha: 1),
            AppColors.buttonColor.withValues(alpha: 1),
          ],
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: 'ExpletusSans',
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          letterSpacing: 0.24,
          fontSize: 20,
        ),
      ),
    );
  }
}
