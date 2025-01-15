import 'package:flutter/material.dart';

class Excercise extends StatefulWidget {
  const Excercise({super.key});

  @override
  State<Excercise> createState() => _ExcerciseState();
}

class _ExcerciseState extends State<Excercise> {
  @override
  Widget build(BuildContext context) {
    // Responsive text styles
    TextStyle titleTextStyle = TextStyle(
      fontSize:
          MediaQuery.of(context).size.width * 0.05, // Scales with device width
      fontWeight: FontWeight.bold,
    );

    TextStyle bodyTextStyle = TextStyle(
      fontSize:
          MediaQuery.of(context).size.width * 0.04, // Scales with device width
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exercise and Mindfulness",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Text(
          "Details about Exercise and Mindfulness",
          style: bodyTextStyle,
          textAlign: TextAlign.center, // Centers the text for uniform display
        ),
      ),
    );
  }
}
