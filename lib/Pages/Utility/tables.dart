import 'package:flutter/material.dart';

// Function to build a table with given rows and columns
Table buildTable({
  required int rows,
  required int columns,
  required List<List<String>> labels,
  required List<List<TextEditingController?>> controllers,
  required List<List<bool>> isEditable,
  required List<List<Function(String)?>> onChanged,
}) {
  return Table(
    border: TableBorder.all(),
    columnWidths: const {
      0: IntrinsicColumnWidth(), // Label column
      1: FlexColumnWidth(), // Input column
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: List.generate(rows, (rowIndex) {
      return TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            labels[rowIndex][0], // Label Text
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: controllers[rowIndex][0] != null
              ? TextFormField(
                  controller: controllers[rowIndex][0], // Assign controller
                  onChanged: onChanged[rowIndex][0],
                  enabled: isEditable[rowIndex][0], // Enable/disable field
                  decoration: InputDecoration(
                    hintText: "Enter ${labels[rowIndex][0]}",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              : (rowIndex == 3 // BMI row index
                  ? Text(
                      // Calculate BMI using the controllers for weight and height
                      (() {
                        double weight =
                            double.tryParse(controllers[1][0]?.text ?? '0') ??
                                0;
                        double height =
                            double.tryParse(controllers[2][0]?.text ?? '0') ??
                                0;
                        if (weight > 0 && height > 0) {
                          // BMI formula: weight (kg) / height (m)²
                          return (weight / (height / 100 * height / 100))
                              .toStringAsFixed(2);
                        } else {
                          return "BMI not available";
                        }
                      })(),
                      style: const TextStyle(fontSize: 16),
                    )
                  : Container()),
        ),
      ]);
    }),
  );
}
