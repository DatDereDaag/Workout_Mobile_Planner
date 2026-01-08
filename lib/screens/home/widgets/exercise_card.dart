import 'dart:ui';

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
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              height: 30,
              color: const Color.fromARGB(255, 123, 17, 17),
              child: Text(
                exerciseName,
                style: TextStyle(
                  fontFamily: 'BlackOps',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
