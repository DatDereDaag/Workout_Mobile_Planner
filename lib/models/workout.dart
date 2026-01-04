import 'package:fitness_app/models/workout_exercise.dart';
import 'package:hive/hive.dart';

part 'workout.g.dart';

@HiveType(typeId: 1)
class Workout {
  @HiveField(0)
  final int workoutId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<WorkoutExercise> exercises;

  @HiveField(3)
  final DateTime date;

  const Workout({
    required this.workoutId,
    required this.name,
    required this.exercises,
    required this.date,
  });
}
