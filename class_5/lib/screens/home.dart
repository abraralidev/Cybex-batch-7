// ignore_for_file: unused_field, prefer_final_fields, unused_element

import 'package:class_5/screens/search.dart';
import 'package:flutter/material.dart';
import 'category.dart';
import 'homescreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    SearchScreen(),
    CategoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var colorlist = [Colors.red, Colors.blue, Colors.pink];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        
        onTap: _onItemTapped,
        backgroundColor: colorlist[_selectedIndex],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
              backgroundColor: Colors.pink),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
