import 'package:flutter/material.dart';
import 'package:diacare360/Pages/homePageGrid/medication/taskBar.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

//Dosage
//Auto timings
//Alarms
//Design of medications details
//hba1c ui designs shown in percentage 28.7 X A1C – 46.7 = eAG.
//food images generation
//calender package
//alarm page ki details fill kiti hoi ya nahi


class _MedicationsState extends State<Medications> {
  // List to hold rows of data for the table
  List<List<TextEditingController?>> rows = [];

  @override
  void dispose() {
    // Dispose of controllers to avoid memory leaks
    for (var row in rows) {
      for (var controller in row) {
        controller?.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
          "Medication",
          style: titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          TaskBar(),
        ],
      ),
    );
  }
}
