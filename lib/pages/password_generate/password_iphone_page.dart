import 'package:flutter/material.dart';

class PasswordIphone extends StatefulWidget {
  const PasswordIphone({super.key});

  @override
  State<PasswordIphone> createState() => _PasswordIphoneState();
}

class _PasswordIphoneState extends State<PasswordIphone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password generated'),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Coming soon',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 192, 192, 192)
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}