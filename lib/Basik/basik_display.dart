import 'package:fiagdon/Culture/culture_display.dart';
import 'package:fiagdon/Home/home_display.dart';
import 'package:fiagdon/Place/place_display.dart';
import 'package:fiagdon/Theme/Theme.dart';
import 'package:flutter/material.dart';

class BasikDisplayWidget extends StatefulWidget {
  const BasikDisplayWidget({super.key});

  @override
  State<BasikDisplayWidget> createState() => _BasikDisplayWidgetState();
}

class _BasikDisplayWidgetState extends State<BasikDisplayWidget> {
  int _selectedTab = 0;
  void onSelectedTab(int index) {
    // ignore: unrelated_type_equality_checks
    if (onSelectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('OSSETIA')),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Container(
              color: ThemeColor.display, child: const PlaceDisplayWidget()),
          const HomeDisplayWidget(),
          const CultureDisplayWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: ThemeColor.iconUnselected,
        currentIndex: _selectedTab,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.place_outlined), label: 'Места'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Дома'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Культура'),
        ],
        onTap: (onSelectedTab),
      ),
    );
  }
}
