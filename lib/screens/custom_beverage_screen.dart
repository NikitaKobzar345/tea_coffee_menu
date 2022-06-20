import 'package:flutter/material.dart';

class CustomBeverageScreen extends StatefulWidget {
  const CustomBeverageScreen({Key? key}) : super(key: key);

  @override
  State<CustomBeverageScreen> createState() => _CustomBeverageScreenState();
}

class _CustomBeverageScreenState extends State<CustomBeverageScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать напиток '),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
            TextField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  hintText: 'Название напитка'),
              controller: _titleController,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.list_alt),
                  border: OutlineInputBorder(),
                  hintText: 'Ингредиенты'),
              controller: _ingredientsController,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.emoji_food_beverage),
                  border: OutlineInputBorder(),
                  hintText: 'Тип напитка'),
              controller: _typeController,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Создать'),
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
