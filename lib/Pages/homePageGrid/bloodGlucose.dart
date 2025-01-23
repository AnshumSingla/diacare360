import 'package:diacare360/Pages/Utility/lineGraph.dart';
import 'package:diacare360/Pages/Utility/points.dart';
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

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blood Glucose",
          style: titleTextStyle,
        ),
      ),
      body: Center(  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(
                "Blood Glucose Levels Over Time",
                style: bodyTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.6,
              child: Container(
                color: const Color.fromARGB(255, 219, 216, 216),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: lineGraph(dayPointData),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
