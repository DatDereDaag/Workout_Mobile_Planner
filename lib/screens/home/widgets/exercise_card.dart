import 'dart:ui';

import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:fitness_app/screens/home/utils/exercise_card_clipper.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String description;
  final String gifURL;

  const ExerciseCard({
    super.key,
    required this.exerciseName,
    required this.description,
    required this.gifURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, bottom: 0, right: 16.0, top: 32.0),
      child: Stack(
        children: [
          //Exercise Card Background Image
          ClipPath(
            clipper: ExerciseCardClipper(),
            child: Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bicep-curl.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //Blur Effect
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    height: 140,
                    color: const Color.fromARGB(255, 42, 7, 7).withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
          //Exercise Card Title
          Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 0.0,
              right: 16.0,
              bottom: 0.0,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(4),
                boxShadow: AppShadows.labelShadow,
              ),
              child: Text(
                exerciseName.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'BlackOps',
                  fontSize: 18,
                  letterSpacing: 1.1,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ),
          // Sets and Reps Widget
          Positioned(
            bottom: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.0,
              children: [
                //Sets
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: AppShadows.labelShadow,
                  ),
                  child: Text(
                    "Sets: 4",
                    style: TextStyle(
                      fontFamily: 'BlackOps',
                      fontSize: 12,
                      letterSpacing: -0.12,
                      color: AppColors.textColor,
                    ),
                  ),
                ),

                //Reps
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: AppShadows.labelShadow,
                  ),
                  child: Text(
                    "Reps: 12",
                    style: TextStyle(
                      fontFamily: 'BlackOps',
                      fontSize: 12,
                      letterSpacing: -0.12,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                //Weight
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: AppShadows.labelShadow,
                  ),
                  child: Text(
                    "Weight: 60 lbs",
                    style: TextStyle(
                      fontFamily: 'BlackOps',
                      fontSize: 12,
                      letterSpacing: -0.12,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
