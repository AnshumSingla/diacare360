import 'package:flutter/material.dart';

class Educationmodules extends StatefulWidget {
  const Educationmodules({super.key});

  @override
  State<Educationmodules> createState() => _EducationmodulesState();
}

class _EducationmodulesState extends State<Educationmodules> {
  @override
  Widget build(BuildContext context) {
    // Responsive text styles
    TextStyle titleTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.05, // Scales with device width
      fontWeight: FontWeight.bold,
    );

    TextStyle bodyTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.04, // Scales with device width
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Education Modules",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Text(
          "Details about Education Modules",
          style: bodyTextStyle,
          textAlign: TextAlign.center, // Centers the text for uniform display
        ),
      ),
    );
  }
}
