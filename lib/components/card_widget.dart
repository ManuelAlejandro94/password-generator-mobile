import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.title});

  final String title;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>{
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final screenHeigth = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.4;
    final cardHeigth = screenHeigth * 0.35;
    double fontSize = screenWidth * 0.06;

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: cardWidth,
        height: cardHeigth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 12, 12, 76),
              Color.fromARGB(255, 25, 25, 112),
              Color.fromARGB(255, 47, 47, 142)
            ],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: fontSize,
              color: const Color.fromARGB(255, 192, 192, 192),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}