import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator_mobile/classes/exact_class.dart';
import 'package:password_generator_mobile/classes/general_class.dart';
import 'package:http/http.dart' as http;

Future<GeneralResponse> fetchPasswordGenerated(ExactBody params) async {
  final body = {
    "uppercase": params.uppercase,
    "lowercase": params.lowercase,
    "digits": params.digits,
    "special_characters": params.special_characters
  };

  final response = await http.post(
    Uri.parse("https://password-generator-yjm5.onrender.com/generate-password-exact"),
    headers: { HttpHeaders.contentTypeHeader: "application/json" }, 
    body: jsonEncode(body)
  );

  if (response.statusCode == 200) {
    return GeneralResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load password');
  }
}

class PasswordExact extends StatefulWidget {
  const PasswordExact({super.key, required this.params});

  final ExactBody params;

  @override
  State<PasswordExact> createState() => _PasswordExactState();
}

class _PasswordExactState extends State<PasswordExact> {

  late Future<GeneralResponse> _futurePassword;
  TextEditingController controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _futurePassword = fetchPasswordGenerated(widget.params);
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
              FutureBuilder(
                future: _futurePassword,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
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
                  else if (snapshot.hasError){
                    return Text('${snapshot.error}');
                  }

                  return const Text(
                    'Loading password generated',
                    style: TextStyle(fontSize: 24),
                  );
                }
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futurePassword = fetchPasswordGenerated(widget.params);
                  });
                },
                child: const Text(
                  'Generate new password',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
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
                            onPressed: () {},
                          ),
                        )
                      );
                    } );
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