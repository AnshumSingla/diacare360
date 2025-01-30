import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

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
  String errorMessage = '';

  @override
  void initState() {
    super.initState();

    // Initialize the date controller with today's date in dd-MM-yyyy format
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    dateController = TextEditingController(text: formattedDate);
  }

  @override
  void dispose() {
    dateController
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

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
          "Anthropometric Details",
          style: titleTextStyle,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Details about Anthropometry",
                style: bodyTextStyle,
                textAlign: TextAlign.center, // Centers the text
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(64),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  _buildTableRow('Date', dateController, (value) {
                    setState(() {
                      if (!isValidDate(value)) {
                        errorMessage =
                            'Invalid date format. Please use dd-mm-yyyy.';
                      } else {
                        errorMessage = ''; // Clear the error message if valid
                      }
                    });
                  }),
                  _buildTableRow('Weight (Kg)', 'Enter Weight', (value) {
                    setState(() {
                      weight = double.tryParse(value) ??
                          0; // Storing the weight value
                      _calculateBMI(); // Recalculate BMI when weight changes
                    });
                  }),
                  _buildTableRow('Height (cm)', 'Enter Height', (value) {
                    setState(() {
                      height = double.tryParse(value) ??
                          0; // Storing the height value
                      _calculateBMI(); // Recalculate BMI when height changes
                    });
                  }),
                  _buildTableRow('BMI (kg/m2)', bmi.toStringAsFixed(2), null,
                      isEditable: false), // BMI field is now non-editable
                  _buildTableRow('Waist Diameter(cm)', 'Enter Diameter',
                      (value) {
                    setState(() {
                      diameter = double.tryParse(value) ??
                          0; // Storing the weight value
                      _calculateBMI(); // Recalculate BMI when weight changes
                    });
                  }),
                ],
              ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build each row of the table
  TableRow _buildTableRow(
      String label, dynamic hint, Function(String)? onChanged,
      {bool isEditable = true}) {
    return TableRow(
      children: <Widget>[
        Container(
          height: 40,
          padding: const EdgeInsets.all(8),
          child: Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ),
        TableCell(
          child: Container(
            height: 40,
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: hint is TextEditingController
                  ? hint
                  : null, // Use controller for date field
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hint is String ? hint : 'Enter Date',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              enabled:
                  isEditable, // Set 'enabled' to false to make it non-editable
              keyboardType:
                  TextInputType.text, // Allow text input for date field
            ),
          ),
        ),
      ],
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
