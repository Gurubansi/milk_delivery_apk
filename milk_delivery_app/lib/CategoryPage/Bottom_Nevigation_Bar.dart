// bottom_navigation.dart

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blueGrey,
      onTap: widget.onItemTapped,
    );
  }
}











