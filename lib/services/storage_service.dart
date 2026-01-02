import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';

class StorageService {
  static const String _exerciseBoxName = 'exerciseBox';

  static Box<Exercise> get _exerciseBox => Hive.box<Exercise>(_exerciseBoxName);

  static Future<void> saveExercises(
    List<Exercise> exercises,
    String bodyPart,
  ) async {
    for (var exercise in exercises) {
      await _exerciseBox.put(exercise.id, exercise);
    }

    await _addCachedBodyPart(bodyPart);
  }

  static Future<void> _addCachedBodyPart(String bodyPart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('cached_bodypart_$bodyPart', true);
  }

  static Future<bool> isBodyPartCached(String bodyPart) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('cached_bodypart_$bodyPart') ?? false;
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
}
