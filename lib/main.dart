import 'package:flutter/material.dart';
import 'package:password_generator_mobile/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 25, 25, 112),
          foregroundColor: Color.fromARGB(255, 192, 192, 192),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 192, 192, 192)),
          centerTitle: true
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 25, 25, 112)),
            foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 192, 192, 192)),
            minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color.fromARGB(255, 192, 192, 192),
        )
      ),
      title: 'Password generated',
      home: const HomePage(),
    );
  }
}