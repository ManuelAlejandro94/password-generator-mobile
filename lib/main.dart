import 'package:flutter/material.dart';
import 'package:password_generator_mobile/pages/basic_page.dart';
import 'package:password_generator_mobile/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87
      ),
      title: 'Password generated',
      home: const MenuPage(),
    );
  }
}