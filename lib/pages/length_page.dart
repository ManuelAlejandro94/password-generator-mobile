import 'package:flutter/material.dart';
import 'package:password_generator_mobile/pages/password_generate/password_length_page.dart';

class LengthPage extends StatefulWidget {
  const LengthPage({super.key});

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Length password'),
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
                'Length of you password',
                style: TextStyle(
                  fontSize: 25,
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
                  fillColor: Colors.amber.shade50
                ),
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: controller,
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordLengthGenerated(length: controller.value.text))
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