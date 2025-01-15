import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
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
          "Diet",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Text(
          "Details about Diet",
          style: bodyTextStyle,
          textAlign: TextAlign.center, // Centers the text for uniform display
        ),
      ),
    );
  }
}
