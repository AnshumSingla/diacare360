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

  @override
  void dispose() {
    dateController.dispose();
    weightController.dispose();
    heightController.dispose();
    diameterController.dispose();
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
          "Anthropometric Details",
          style: titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(64),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    tables.buildTableRow('Date', '', dateController),
                    tables.buildTableRow(
                      'Weight (Kg)',
                      'Enter Weight',
                      weightController,
                      onChanged: (value) {
                        setState(() {
                          weight = double.tryParse(value) ?? 0;
                          _calculateBMI();
                        });
                      },
                    ),
                    tables.buildTableRow(
                      'Height (cm)',
                      'Enter Height',
                      heightController,
                      onChanged: (value) {
                        setState(() {
                          height = double.tryParse(value) ?? 0;
                          _calculateBMI();
                        });
                      },
                    ),
                    tables.buildTableRow(
                      'BMI (kg/m²)',
                      bmi.toStringAsFixed(2),
                      null,
                      isEditable: false, // BMI field is non-editable
                    ),
                    tables.buildTableRow(
                      'Waist Diameter (cm)',
                      'Enter Diameter',
                      diameterController,
                      onChanged: (value) {
                        setState(() {
                          diameter = double.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ],
                ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.1),
                guage.radialGauge('BMI', bmi),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to validate date in dd-MM-yyyy format
  bool isValidDate(String date) {
    RegExp dateExp = RegExp(r'^\d{2}-\d{2}-\d{4}$');
    return dateExp.hasMatch(date);
  }

  // Function to calculate BMI when weight or height changes
  void _calculateBMI() {
    if (weight > 0 && height > 0) {
      setState(() {
        bmi = weight / ((height / 100) * (height / 100)); // BMI formula
      });
    } else {
      setState(() {
        bmi = 0; // Reset BMI if either weight or height is invalid
      });
    }
  }
}
