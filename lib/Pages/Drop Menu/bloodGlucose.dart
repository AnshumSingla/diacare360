import 'package:diacare360/Pages/Utility/DropMenu.dart';
import 'package:flutter/material.dart';

class BloodGlucose extends StatefulWidget {
  const BloodGlucose({super.key});

  @override
  State<BloodGlucose> createState() => _BloodGlucoseState();
}

class _BloodGlucoseState extends State<BloodGlucose> {
  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.05,
      fontWeight: FontWeight.bold,
    );

    TextStyle bodyTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.04,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blood Glucose",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Text(
          "Details about Blood Glucose",
          style: bodyTextStyle,
          textAlign: TextAlign.center, // Centers the text properly
        ),
      ),
      drawer: const Dropmenu(),
    );
  }
}
