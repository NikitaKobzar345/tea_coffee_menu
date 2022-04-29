import 'package:flutter/material.dart';
import 'package:menu/screens/custom_beverage_screen.dart';

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
          drawer: Drawer(
            child: Column(children: const [Text('A')]),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Меню'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.attach_money),
              ),
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
            tooltip: 'Создать напиток',
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
          )),
    );
  }

  GridView grid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
