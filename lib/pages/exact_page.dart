import 'package:flutter/material.dart';
import 'package:password_generator_mobile/classes/exact_class.dart';
import 'package:password_generator_mobile/pages/password_generate/password_exact_page.dart';

class ExactPage extends StatefulWidget {
  const ExactPage({super.key});

  @override
  State<ExactPage> createState() => _ExactPageState();
}

class _ExactPageState extends State<ExactPage> {

  final controllerUppercase = TextEditingController();
  final controllerLowercase = TextEditingController();
  final controllerDigits = TextEditingController();
  final controllerSpecial = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exact password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Password elements',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerUppercase,
                decoration: const InputDecoration(
                  hintText: 'Number of Capitalize letters'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerLowercase,
                decoration: const InputDecoration(
                  hintText: 'Number of Lowercase letters'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerDigits,
                decoration: const InputDecoration(
                  hintText: 'Number of digits'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerSpecial,
                decoration: const InputDecoration(
                  hintText: 'Number of Special characters'
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  ExactBody params = ExactBody(
                    uppercase: int.parse(controllerUppercase.text),
                    lowercase: int.parse(controllerLowercase.text),
                    digits: int.parse(controllerDigits.text),
                    special_characters: int.parse(controllerSpecial.text)
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordExact(params: params))
                  );
                },
                child: const Text(
                  "Generate password",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}