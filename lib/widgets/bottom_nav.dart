import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int selectedItem;
  const BottomNav({super.key, required this.selectedItem});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  void changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      //settings
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.grey,
            ),
            label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            label: 'Settings'),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.selectedItem,
      onTap: changeSelectedNavBar,
    );
  }
}
