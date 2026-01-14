import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/workouts/views/workouts_screen.dart';
import 'package:fitness_app/screens/catalogue/views/catalogue_screen.dart';
import 'package:fitness_app/screens/home/views/home_screen.dart';
import 'package:fitness_app/screens/profile/views/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _screenIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    WorkoutScreen(),
    CatalogueScreen(),
    ProfileScreen(),
  ];

  final List<String> screenTitles = const [
    'Home',
    'Workouts',
    'Catalogue',
    'Profile',
  ];

  void _onBottomNavbarTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _screenIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavbarTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _screenIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.textColor,
        unselectedItemColor: AppColors.accentColor,
        backgroundColor: AppColors.primaryColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontFamily: 'Hindsight2020',
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.accentColor,
          fontSize: 14,
          fontFamily: 'Hindsight2020',
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
