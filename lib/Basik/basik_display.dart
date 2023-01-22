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
    if (onSelectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Container(color: ThemeColor.display, child: PlaceDisplayWidget()),
          HomeDisplayWidget(),
          CultureDisplayWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: ThemeColor.iconUnselected,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.place_outlined), label: 'Места'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined), label: 'Дома'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.book_outlined), label: 'Культура'),
        ],
        onTap: (onSelectedTab),
      ),
    );
  }
}
