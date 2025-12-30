import 'package:fitness_app/screens/calendar/views/calendar_screen.dart';
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
    CatalogueScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  void _onBottomNavbarTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fitness App')),
      body: IndexedStack(index: _screenIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavbarTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _screenIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red.shade700,
        unselectedItemColor: Colors.red.shade100,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
