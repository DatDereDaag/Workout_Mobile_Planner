import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String equipment;

  @HiveField(3)
  final String target;

  @HiveField(4)
  final String bodyPart;

  @HiveField(5)
  final String gifUrl;

  @HiveField(6)
  final List<String> instructions;

  @HiveField(7)
  final List<String> secondaryMuscles;

  const Exercise({
    required this.id,
    required this.name,
    required this.equipment,
    required this.target,
    required this.bodyPart,
    required this.gifUrl,
    required this.instructions,
    required this.secondaryMuscles,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as String,
      name: json['name'] as String,
      equipment: json['equipment'] as String,
      target: json['target'] as String,
      bodyPart: json['bodyPart'] as String,
      gifUrl: json['gifUrl'] as String,
      instructions: List<String>.from(json['instructions'] ?? []),
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
    );
  }
}
