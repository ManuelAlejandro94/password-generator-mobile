import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:password_generator_mobile/classes/customized_body_class.dart';
import 'package:password_generator_mobile/classes/general_class.dart';

Future<GeneralResponse> fetchPasswordGenerated(CustomizedBody params) async {
  final body = {
    "len": params.len,
    "letters": params.letters,
    "digits": params.digits,
    "special_characters": params.special_characters
  };

  final response = await http.post(
    Uri.parse("https://password-generator-yjm5.onrender.com/generate-password-customize"),
    headers: { HttpHeaders.contentTypeHeader: "application/json" }, 
    body: jsonEncode(body)
  );

  if (response.statusCode == 200) {
    return GeneralResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load password');
  }
}

class PasswordCustomized extends StatefulWidget {
  const PasswordCustomized({super.key, required this.params});

  final CustomizedBody params;

  @override
  State<PasswordCustomized> createState() => _PasswordCustomizedState();
}

class _PasswordCustomizedState extends State<PasswordCustomized> {

  late Future<GeneralResponse> _futurePassword;
  TextEditingController controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _futurePassword = fetchPasswordGenerated(widget.params);
  }
  @override
  Widget build(BuildContext context) {
    //TODO: Generate view of all element
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password generated'),
        backgroundColor: Colors.grey.shade700,
        centerTitle: true,
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
                  color: Colors.white
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
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.amber.shade50
                      ),
                      style: const TextStyle(fontSize: 22),
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50))
                ),
                onPressed: () {
                  setState(() {
                    _futurePassword = fetchPasswordGenerated(widget.params);
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
                  minimumSize: MaterialStateProperty.all(const Size.fromHeight(50))
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