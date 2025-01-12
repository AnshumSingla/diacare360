import 'package:diacare360/Pages/Utility/DropMenu.dart';
import 'package:flutter/material.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
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
          "Medication Details",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Text(
          "Details about Medication",
          style: bodyTextStyle,
          textAlign: TextAlign.center, // Centers the text for uniform display
        ),
      ),
      drawer: const Dropmenu(),
    );
  }
}
