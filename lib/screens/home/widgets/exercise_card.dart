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
    return ClipPath(
      clipper: ExerciseCardClipper1(),
      child: Container(width: 400, height: 200, color: Colors.blue),
    );
  }
}
