import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/profile_history.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map page'),
      ),
      bottomNavigationBar: CustomNavBar(selectedIndex: 1),
    );
  }
}

// Custom Bottom Navigation Bar
class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  CustomNavBar({required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // Prevent reloading the same page

    Widget nextPage;
    if (index == 0) {
      nextPage = HomePage();
    } else if (index == 1) {
      nextPage = MapPage();
    } else {
      nextPage = ProfilePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}