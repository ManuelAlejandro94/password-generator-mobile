import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'classes/password_class.dart';
import 'package:flutter/services.dart';

Future<Password> fetchPasswordGenerated() async {
  final response = await http.get(Uri.parse('https://password-generator-yjm5.onrender.com/generate-password'));

  if(response.statusCode == 200){
    return Password.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  else{
    throw Exception('Failed to load password');
  }

}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Password> _futurePassword;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futurePassword = fetchPasswordGenerated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password generator'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your password generated:',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 10,),
              FutureBuilder<Password>(
                future: _futurePassword,
                builder:(context, snapshot) {
                  if(snapshot.hasData){
                    controller.text = snapshot.data!.password;
                    return TextField(
                      textAlign: TextAlign.center,
                      controller: controller,
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.amber.shade50
                      ),
                      style: const TextStyle(fontSize: 22),
                    );
                  }
                  else if(snapshot.hasError){
                    return Text('${snapshot.error}');
                  }

                  return const Text(
                    'Your password generated',
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.red.shade900),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                ),
                onPressed: () {
                  setState(() {
                    _futurePassword = fetchPasswordGenerated();
                  });
                },
                child: const Text(
                  "Generate new password",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                ),
                onPressed:() {
                  Clipboard.setData(ClipboardData(text: controller.text)).
                    then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Password copy to clipboard',
                            style: TextStyle(fontSize: 20),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed:() {
                            },
                          ),
                        )
                      );
                    });
                },
                child: const Text(
                  'Copy',
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}