import 'package:diacare360/Pages/Utility/DropMenu.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
          "Anthropometric Details",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Text(
          "Details about Anthropometry",
          style: bodyTextStyle,
          textAlign: TextAlign.center, // Centers the text
        ),
      ),
      drawer: const Dropmenu(),
    );
  }
}
