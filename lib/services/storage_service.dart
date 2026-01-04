import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/models/workout_exercise.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';

class StorageService {
  static const String _exerciseBoxName = 'exerciseBox';
  static const String _workoutBoxName = 'workoutBox';

  static Box<Exercise> get _exerciseBox => Hive.box<Exercise>(_exerciseBoxName);
  static Box<Workout> get _workoutBox => Hive.box<Workout>(_workoutBoxName);

  static Future<void> saveExercises(
    List<Exercise> exercises,
    String bodyPart,
  ) async {
    for (var exercise in exercises) {
      await _exerciseBox.put(exercise.id, exercise);
    }

    await _addCachedBodyPart(bodyPart);
  }

  static Future<void> saveWorkout(Workout workout) async {
    await _workoutBox.put(workout.workoutId, workout);
  }

  static List<Workout> getAllWorkouts() {
    return _workoutBox.values.toList();
  }

  static Future<void> deleteWorkout(int workoutId) async {
    await _workoutBox.delete(workoutId);
  }

  static Future<void> addWorkoutExercise(
    WorkoutExercise newWorkoutExercise,
    int workoutId,
  ) async {
    final currentWorkout = getWorkout(workoutId);

    if (currentWorkout == null) return;

    final List<WorkoutExercise> updatedExercises = List<WorkoutExercise>.from(
      currentWorkout.exercises,
    )..add(newWorkoutExercise);

    final updatedWorkout = Workout(
      workoutId: workoutId,
      name: currentWorkout.name,
      exercises: updatedExercises,
      date: DateTime.now(),
    );

    await saveWorkout(updatedWorkout);
  }

  static Future<void> editWorkoutExercise(
    WorkoutExercise updatedWorkoutExercise,
    int index,
    int workoutId,
  ) async {
    final currentWorkout = getWorkout(workoutId);

    if (currentWorkout == null) return;

    final List<WorkoutExercise> updatedExercises = List<WorkoutExercise>.from(
      currentWorkout.exercises,
    );
    updatedExercises[index] = updatedWorkoutExercise;

    final updatedWorkout = Workout(
      workoutId: workoutId,
      name: currentWorkout.name,
      exercises: updatedExercises,
      date: DateTime.now(),
    );

    await saveWorkout(updatedWorkout);
  }

  static Future<void> deleteWorkoutExercise(int index, int workoutId) async {
    final currentWorkout = getWorkout(workoutId);

    if (currentWorkout == null) return;

    final List<WorkoutExercise> updatedExercises = List<WorkoutExercise>.from(
      currentWorkout.exercises,
    )..removeAt(index);

    final updatedWorkout = Workout(
      workoutId: workoutId,
      name: currentWorkout.name,
      exercises: updatedExercises,
      date: DateTime.now(),
    );

    await saveWorkout(updatedWorkout);
  }

  static Future<void> _addCachedBodyPart(String bodyPart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('cached_bodypart_$bodyPart', true);
  }

  static Future<bool> isBodyPartCached(String bodyPart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('cached_bodypart_$bodyPart') ?? false;
  }

  static Future<void> assignWorkoutToDay(String day, int workoutId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('workout_for_$day', workoutId);
  }

  static Future<void> assignRestDay(String day) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('workout_for_$day', 'rest');
  }

  static List<Exercise> getExerciseByBodyPart(String bodyPart) {
    return _exerciseBox.values
        .where(
          (exercise) =>
              exercise.bodyPart.toLowerCase() == bodyPart.toLowerCase(),
        )
        .toList();
  }

  static List<Exercise> getAllExercises() {
    return _exerciseBox.values.toList();
  }

  static Workout? getWorkout(int workoutId) {
    if (_workoutBox.isNotEmpty) {
      return _workoutBox.get(workoutId);
    }
    return null;
  }
}
