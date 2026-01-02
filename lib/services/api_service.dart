import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models//exercise.dart';

class ApiService {
  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com';
  static String get _apiKey => dotenv.env['EXERCISE_DB_API_KEY'] ?? '';
  static const int limit = 25;

  static Future<List<Exercise>> fetchExerciseByBodyPart(String bodyPart) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/exercises/bodyPart/$bodyPart/?limit=$limit'),
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }
}
