import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menu/screens/bottom_navigation_bar_template.dart';
import 'package:menu/widget/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // themeMode: ThemeMode.system,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarTamplate(),
    );
  }
}
