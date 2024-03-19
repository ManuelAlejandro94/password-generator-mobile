import 'package:flutter/material.dart';
import 'package:password_generator_mobile/pages/basic_page.dart';
import 'package:password_generator_mobile/pages/customize_page.dart';
import 'package:password_generator_mobile/pages/length_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select type of password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage())
                  );
                },
                child: const Text(
                  "Basic password",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LengthPage())
                  );
                },
                child: const Text(
                  "Choose length",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CustomizePage())
                  );
                },
                child: const Text(
                  "Customize password",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}