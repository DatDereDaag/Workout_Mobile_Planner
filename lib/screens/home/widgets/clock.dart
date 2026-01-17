import 'dart:async';
import 'dart:math';

import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late bool _showColon = true;
  late String _clockTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());
  }

  void _updateTime() {
    final time = DateTime.now();

    int hour = time.hour % 12;
    if (hour == 0) hour = 12;

    final period = time.hour >= 12 ? 'P.M.' : 'A.M.';

    setState(() {
      _showColon = !_showColon;

      _showColon
          ? _clockTime =
                '${hour.toString()}:'
                '${time.minute.toString().padLeft(2, '0')}'
                ' $period'
          : _clockTime =
                '${hour.toString()} '
                '${time.minute.toString().padLeft(2, '0')}'
                ' $period';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Red Curves Styling
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Transform.rotate(
            alignment: Alignment.center,
            angle: -pi / 72,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.1, 0.3, 0.7, 1],
                  colors: [
                    AppColors.primaryColor,
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.primaryColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),

        //Clock
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: AppShadows.containerShadow,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.2, 0.8, 1],
                colors: [
                  AppColors.primaryColor.withValues(alpha: 0.8),
                  AppColors.containerColor.withValues(alpha: 0.8),
                  AppColors.containerColor.withValues(alpha: 0.8),
                  AppColors.primaryColor.withValues(alpha: 0.8),
                ],
              ),

              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              _clockTime,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Hindsight2020',
                fontSize: 56,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
