import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/screens/main_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();

  Hive.registerAdapter(ExerciseAdapter());

  await Hive.openBox<Exercise>('exerciseBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFCF0F47)),
      ),
    );
  }
}
