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
        backgroundColor: Color.fromARGB(179, 138, 90, 90),
        foregroundColor: Colors.black,
        centerTitle: true,
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber.shade50,
                  hintText: 'Length'
                ),
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: controllerLength,
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber.shade50,
                  hintText: 'Minimum number of letters'
                ),
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: controllerLetters,
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber.shade50,
                  hintText: 'Number of digits'
                ),
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: controllerDigits,
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber.shade50,
                  hintText: 'Number of special characters'
                ),
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: controllerSpecial,
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50))
                ),
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