import 'package:fitness_app/screens/home/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 6,
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
