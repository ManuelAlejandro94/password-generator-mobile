import 'package:flutter/material.dart';
import 'package:password_generator_mobile/components/card_widget.dart';
import 'package:password_generator_mobile/pages/basic_page.dart';
import 'package:password_generator_mobile/pages/customize_page.dart';
import 'package:password_generator_mobile/pages/length_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select type of password'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BasicPage())
                    );
                  },
                  child: const CardWidget(title: 'Basic password'),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LengthPage())
                    );
                  },
                  child: const CardWidget(title: 'Choose Length'),
                ),
              ],
            )
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CustomizePage())
                    );
                  },
                  child: const CardWidget(title: 'Customize password'),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {},
                  child: const CardWidget(title: 'Coming Soon'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}