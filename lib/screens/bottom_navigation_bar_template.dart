import 'package:flutter/material.dart';
import 'package:menu/screens/achiviements_screen.dart';
import 'package:menu/screens/chat_bot_screen.dart';
import 'package:menu/screens/favourites_screen.dart';
import 'package:menu/screens/menu_screen.dart';

class BottomNavigationBarTamplate extends StatefulWidget {
  const BottomNavigationBarTamplate({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarTamplate> createState() =>
      _BottomNavigationBarTamplateState();
}

class _BottomNavigationBarTamplateState
    extends State<BottomNavigationBarTamplate> {
  int _navBarIndex = 0;

  final _screens = [
    const MenuScreen(),
    const AchiviementsScreen(),
    const FavouritesScreen(),
    const ChatBotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _navBarIndex,
        onTap: (index) {
          setState(() {
            _navBarIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Достижения'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              label: 'Чат - бот'),
        ],
      ),
      body: _screens[_navBarIndex],
    );
  }
}
