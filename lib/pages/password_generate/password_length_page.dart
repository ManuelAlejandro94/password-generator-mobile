import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator_mobile/classes/password_class.dart';
import 'package:http/http.dart' as http;

Future<Password> fetchPasswordGenerated(String len) async {
  final response = await http.get(Uri.parse('https://password-generator-yjm5.onrender.com/generate-password-length/$len'));

  if(response.statusCode == 200){
    return Password.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  else{
    throw Exception('Failed to load password');
  }

}

class PasswordLengthGenerated extends StatefulWidget {
  const PasswordLengthGenerated({super.key, required this.length});

  final String length;

  @override
  State<PasswordLengthGenerated> createState() => _PasswordLengthGeneratedState();
}

class _PasswordLengthGeneratedState extends State<PasswordLengthGenerated> {

  late Future<Password> _futurePassword;
  TextEditingController controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _futurePassword = fetchPasswordGenerated(widget.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password generated'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your password generated',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 192, 192, 192)
                ),
              ),
              const SizedBox(height: 10,),
              FutureBuilder<Password>(
                future: _futurePassword,
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    controller.text = snapshot.data!.password;
                    return TextField(
                      textAlign: TextAlign.center,
                      controller: controller,
                      enabled: false,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 51, 51, 51)
                      ),
                    );
                  }
                  else if(snapshot.hasError){
                    return Text('${snapshot.error}');
                  }

                  return const Text(
                    'Your password generated',
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futurePassword = fetchPasswordGenerated(widget.length);
                  });
                },
                child: const Text(
                  'Generate new password',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
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