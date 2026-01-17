import 'dart:math';

import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({super.key});

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(-20, -35),
          child: Transform.rotate(
            angle: -pi / 12,
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.labelShadow,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/ab.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),

        //Gradient Over 3rd Image
        Transform.translate(
          offset: Offset(-20, -35),
          child: Transform.rotate(
            angle: -pi / 12,
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      AppColors.backgroundColor.withValues(alpha: 0.4),
                      AppColors.backgroundColor.withValues(alpha: 0.4),
                      AppColors.primaryColor.withValues(alpha: 1),
                    ],
                    stops: [0.0, 0.4, 0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),

        Transform.translate(
          offset: Offset(-8, -20),
          child: Transform.rotate(
            angle: -pi / 32,
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.labelShadow,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/squat.jpg'),
                    opacity: 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),

        //Gradient Over 2nd Image
        Transform.translate(
          offset: Offset(-8, -20),
          child: Transform.rotate(
            angle: -pi / 32,
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      AppColors.backgroundColor.withValues(alpha: 0.4),
                      AppColors.backgroundColor.withValues(alpha: 0.4),
                      AppColors.primaryColor.withValues(alpha: 1),
                    ],
                    stops: [0.0, 0.4, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsetsGeometry.only(
            top: 40,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: AppShadows.labelShadow,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/bicep-curl.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        //Gradient Over Image
        Padding(
          padding: EdgeInsetsGeometry.only(
            top: 40,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  AppColors.backgroundColor.withValues(alpha: 0.4),
                  AppColors.backgroundColor.withValues(alpha: 0.4),
                  AppColors.primaryColor.withValues(alpha: 1),
                ],
                stops: [0.0, 0.4, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
