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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                textAlign: TextAlign.center,
                enabled: true,
                style: const TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: controller,
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordLengthGenerated(length: controller.value.text))
                  );
                },
                child: const Text(
                  "Generate password",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}