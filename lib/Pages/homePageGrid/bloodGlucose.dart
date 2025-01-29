import 'package:diacare360/Pages/Utility/lineGraph.dart';
import 'package:diacare360/Pages/Utility/points.dart' as points;
import 'package:flutter/material.dart';

class BloodGlucose extends StatefulWidget {
  const BloodGlucose({super.key});

  @override
  State<BloodGlucose> createState() => _BloodGlucoseState();
}

class _BloodGlucoseState extends State<BloodGlucose> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  // Method to check for 3 consecutive high values
  void checkForAlert() {
    if (points.dayPointData.length >= 3) {
      // Get the last three data points
      List<points.PointXY> lastThree =
          points.dayPointData.sublist(points.dayPointData.length - 3);

      // Check if all three values are greater than 250
      bool isHigh = lastThree.every((point) => point.bg > 250);
      bool isLow = lastThree.any((point) => point.bg < 70);
      bool isVeryHIgh = lastThree.any((point) => point.bg > 300);
      if (isHigh) {
        // Display an alert if the condition is met
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Alert"),
            content: const Text("Please contact your doctor immediately"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
      if (isLow) {
        // Display an alert if the condition is met
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Alert"),
            content: const Text("Your Blood Glucose is too low."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
      if (isVeryHIgh) {
        // Display an alert if the condition is met
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Alert"),
            content: const Text(
                "Your Blood Glucose is Really high consult doctor immediately."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    TextStyle titleTextStyle = TextStyle(
      fontSize: screenWidth * 0.05,
      fontWeight: FontWeight.bold,
    );

    TextStyle bodyTextStyle = TextStyle(
      fontSize: screenWidth * 0.04,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blood Glucose",
          style: titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Blood Glucose Levels Over Time",
                style: bodyTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.5,
                child: Container(
                  color: const Color.fromARGB(255, 219, 216, 216),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LineGraph(points.dayPointData),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Form(
                key: formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TextFormField with adjusted width
                    Expanded(
                      flex: 8, // Adjust the space for the TextFormField
                      child: TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: "Enter Blood Glucose",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a number";
                          } else if (double.tryParse(value) == null) {
                            return "Only numeric values are allowed";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets
                              .zero, // Remove internal padding to fit the button perfectly
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final value = double.tryParse(controller.text);
                            if (value != null) {
                              // Add the valid value to the points.dayPointData
                              setState(() {
                                points.getData(value); // Add data point
                                checkForAlert(); // Check for alert
                              });
                              controller
                                  .clear(); // Clear the input field after adding
                            }
                          }
                        },
                        child: const Icon(Icons.check),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
