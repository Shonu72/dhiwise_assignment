import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Text('Item 1: Home'),
    Text('Item 2: Business'),
    Text('Item 3: School'),
    Text('Item 3: School'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          label: 'Refresh',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 111, 44, 228),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      iconSize: 30,
    );
  }
}
