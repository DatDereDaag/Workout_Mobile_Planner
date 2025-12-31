class Exercise {
  final String id;
  final String name;
  final String equipment;
  final String target;
  final String bodyPart;
  final String gifUrl;
  final List<String> instructions;
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
