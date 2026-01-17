import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/shadows.dart';
import 'package:fitness_app/screens/home/widgets/button.dart';
import 'package:fitness_app/screens/home/widgets/clock.dart';
import 'package:fitness_app/screens/home/widgets/exercise_card.dart';
import 'package:fitness_app/screens/home/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

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
      body: Column(
        children: [
          SizedBox(height: 24),
          Clock(),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Button(text: "Create Workout"),
          SizedBox(height: 32),
          //Workout Container
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: AppShadows.labelShadow,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [AppColors.backgroundColor, AppColors.primaryColor],
                ),
              ),
              child: WorkoutCard(),
            ),
          ),
        ],
      ),
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
