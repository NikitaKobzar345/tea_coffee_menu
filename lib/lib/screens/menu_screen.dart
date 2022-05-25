import 'package:flutter/material.dart';
import 'package:menu/screens/custom_beverage_screen.dart';
import 'package:menu/screens/tea_coins_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Меню'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CoinsScreen();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.attach_money))
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Image.asset(
                  'lib/images/1f375.png',
                ),
              ),
              Tab(
                child: Image.asset(
                  'lib/images/Coffee-Cup-Transparent-Background.png',
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          tooltip: 'TEA-коины',
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CustomBeverageScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
