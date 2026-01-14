import 'package:fitness_app/screens/home/widgets/clock.dart';
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

  final List<String> instructions = [
    "Step:1 Lie flat on your back with your legs straight and your arms extended overhead, holding the band.",
    "Step:2 Engage your abs and lift your legs and upper body off the ground simultaneously, reaching your hands towards your toes.",
    "Step:3 As you lower your legs and upper body back down, switch the position of your legs, crossing one over the other.",
    "Step:4 Repeat the movement, alternating the position of your legs with each repetition.",
    "Step:5 Continue for the desired number of repetitions.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [SizedBox(height: 50), Clock()]),
      // body: ListView.builder(
      //   itemCount: 4,
      //   itemBuilder: (context, index) {
      //     return ExerciseCard(
      //       exerciseName: "exercise Name",
      //       exerciseInstructions: instructions,
      //       gifURL: "gifURL",
      //     );
      //   },
      // ),
    );
  }
}
