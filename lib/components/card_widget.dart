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
    final double screenHeigth = MediaQuery.of(context).size.height;
    final double cardMaxWidth = screenWidth * 0.4;
    //final double cardMaxHeigth = screenHeigth * 0.35;
    final double cardMaxHeigth = screenHeigth * 0.20;
    final double fontSize = screenWidth * 0.06;

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        constraints: BoxConstraints(
          maxWidth: cardMaxWidth,
          maxHeight: cardMaxHeigth
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3)
            )
          ],
          gradient: const LinearGradient(
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