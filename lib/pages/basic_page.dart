import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:password_generator_mobile/components/loading_widget.dart';
import '../classes/password_class.dart';
import 'package:flutter/services.dart';

Future<Password> fetchPasswordGenerated() async {
  final response = await http.get(Uri.parse('https://jmhvrh49e8.execute-api.us-east-2.amazonaws.com/dev/generate-password'));

  if(response.statusCode == 200){
    return Password.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  else{
    throw Exception('Failed to load password');
  }

}

class BasicPage extends StatefulWidget {
  const BasicPage({super.key});

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
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
        title: const Text('Basic password'),
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
                  color: Color.fromARGB(255, 192, 192, 192)
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
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 51, 51, 51)
                        ),
                    );
                  }
                  else if(snapshot.hasError){
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