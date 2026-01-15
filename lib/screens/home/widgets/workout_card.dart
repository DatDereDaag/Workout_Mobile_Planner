import 'package:flutter/material.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({super.key});

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/bicep-curl.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
