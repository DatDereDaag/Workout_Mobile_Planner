import 'package:fitness_app/screens/home/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // //Close Hive when done, Put this code elsewhere since it is needed globally

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  final List<String> bodyParts = [
    'back',
    'cardio',
    'chest',
    'lower arms',
    'lower legs',
    'neck',
    'shoulders',
    'upper arms',
    'upper legs',
    'waist',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ExerciseCard(
            exerciseName: "exerciseName",
            description: "description",
            gifURL: "gifURL",
          );
        },
      ),
    );
  }
}
