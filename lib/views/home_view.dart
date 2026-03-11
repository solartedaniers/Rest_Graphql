import 'package:flutter/material.dart';
import 'university_list_view.dart';
import 'country_info_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> _pages = [UniversityListView(), CountryInfoView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Universidades'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'País'),
        ],
      ),
    );
  }
}