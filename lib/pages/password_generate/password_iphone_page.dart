import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator_mobile/classes/general_class.dart';
import 'package:password_generator_mobile/components/loading_widget.dart';
import 'package:http/http.dart' as http;

Future<GeneralResponse> fetchPasswordGenerated() async {
    final response = await http.get(Uri.parse('https://jmhvrh49e8.execute-api.us-east-2.amazonaws.com/dev/v2/iphone-password'));

    if(response.statusCode == 200){
      return GeneralResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else {
      throw Exception('Failed to load password');
    }
  }
class PasswordIphone extends StatefulWidget {
  const PasswordIphone({super.key});

  @override
  State<PasswordIphone> createState() => _PasswordIphoneState();
}

class _PasswordIphoneState extends State<PasswordIphone> {
  late Future<GeneralResponse> _futurePassword;
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
        title: const Text('Password generated'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ const Text(
                'Your password generated',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 192, 192, 192)
                ),
              ),
              const SizedBox(height: 10,),
              FutureBuilder<GeneralResponse>(
                future: _futurePassword,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.text = snapshot.data!.response;
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
                  else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const LoadingWidget();
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futurePassword = fetchPasswordGenerated();
                  });
                },
                child: const Text(
                  "Generate new password",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                )
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