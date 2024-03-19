import 'package:flutter/material.dart';
import 'package:password_generator_mobile/classes/customized_body_class.dart';
import 'package:password_generator_mobile/pages/password_generate/password_customized_page.dart';

class CustomizePage extends StatefulWidget {
  const CustomizePage({super.key});

  @override
  State<CustomizePage> createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {

  final controllerLength = TextEditingController();
  final controllerLetters = TextEditingController();
  final controllerDigits = TextEditingController();
  final controllerSpecial = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Characteristics of password',
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
                controller: controllerLength,
                decoration: const InputDecoration(
                  hintText: 'Length'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                decoration: const InputDecoration(
                  hintText: 'Minimum number of letters'
                ),
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerLetters,
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                decoration: const InputDecoration(
                  hintText: 'Minimum number of digits'
                ),
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerDigits,
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                decoration: const InputDecoration(
                  hintText: 'Minimum number of numbers'
                ),
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 51, 51, 51)
                ),
                keyboardType: TextInputType.number,
                controller: controllerSpecial,
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  CustomizedBody params = CustomizedBody(
                    len: int.parse(controllerLength.text),
                    letters: int.parse(controllerLetters.text),
                    digits: int.parse(controllerDigits.text),
                    special_characters: int.parse(controllerSpecial.text)
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordCustomized(params: params))
                  );
                },
                child: const Text(
                  "Generate password",
                  style: TextStyle(fontSize: 25),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}