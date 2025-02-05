import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:diacare360/Pages/Utility/tables.dart' as tables;
import 'package:diacare360/Pages/Utility/radialGuage.dart' as guage;

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double weight = 0;
  double height = 0;
  double bmi = 0;
  double diameter = 0;
  late TextEditingController dateController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController diameterController;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    dateController = TextEditingController(text: formattedDate);
    weightController = TextEditingController();
    heightController = TextEditingController();
    diameterController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   dateController.dispose();
  //   weightController.dispose();
  //   heightController.dispose();
  //   diameterController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define table data (Labels in left, Input fields in right)
    List<List<String>> labels = [
      ['Date'], 
      ['Weight (Kg)'],
      ['Height (cm)'],
      ['BMI (kg/m²)'],
      ['Waist Diameter (cm)']
    ];

    List<List<TextEditingController?>> controllers = [
      [dateController],
      [weightController],
      [heightController],
      [null], // BMI is calculated dynamically
      [diameterController]
    ];

    List<List<bool>> isEditable = [
      [true],  // Date is editable
      [true],  // Weight is editable
      [true],  // Height is editable
      [false], // BMI is not editable
      [true]   // Waist Diameter is editable
    ];

    List<List<Function(String)?>> onChanged = [
      [(value) {}], // No action needed for Date
      [(value) {
        setState(() {
          weight = double.tryParse(value) ?? 0;
          _calculateBMI();
          checkIfDetailsEntered();
        });
      }],
      [(value) {
        setState(() {
          height = double.tryParse(value) ?? 0;
          _calculateBMI();
          checkIfDetailsEntered();
        });
      }],
      [null], // BMI is auto-calculated
      [(value) {
        setState(() {
          diameter = double.tryParse(value) ?? 0;
          checkIfDetailsEntered();
        });
      }]
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anthropometric Details",
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                tables.buildTable(
                  rows: 5,
                  columns: 2,
                  labels: labels,        // Labels in first column (Left)
                  controllers: controllers, // Form fields in second column (Right)
                  isEditable: isEditable,
                  onChanged: onChanged,
                ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.05),
                guage.radialGauge('BMI', bmi),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to calculate BMI
  void _calculateBMI() {
    if (weight > 0 && height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100));
      });
    } else {
      setState(() {
        bmi = 0;
      });
    }
  }

  bool checkIfDetailsEntered() {
    return weight != 0 || height != 0 || bmi != 0 || diameter != 0;
  }
}
