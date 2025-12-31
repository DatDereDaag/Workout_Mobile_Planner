import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com';
  static String get _apiKey => dotenv.env['EXERCISE_DB_API_KEY'] ?? '';

  static Future<void> fetchExerciseByBodyPart(String bodyPart) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/exercises/bodyPart/$bodyPart'),
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }
}
