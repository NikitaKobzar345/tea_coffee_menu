import 'package:flutter/material.dart';

class CustomBeverageScreen extends StatefulWidget {
  const CustomBeverageScreen({Key? key}) : super(key: key);

  @override
  State<CustomBeverageScreen> createState() => _AchiviementsScreenState();
}

class _AchiviementsScreenState extends State<CustomBeverageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать напиток '),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
