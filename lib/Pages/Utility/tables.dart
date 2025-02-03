import 'package:flutter/material.dart';

// Function to build a TableRow
TableRow buildTableRow(
    String label, String hintText, TextEditingController? controller,
    {bool isEditable = true, Function(String)? onChanged}) {
  return TableRow(
    children: <Widget>[
      Container(
        height: 40,
        padding: const EdgeInsets.all(8),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      TableCell(
        child: Container(
          height: 40,
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            controller: controller, // Use controller if provided
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            enabled: isEditable, // Control editability
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    ],
  );
}