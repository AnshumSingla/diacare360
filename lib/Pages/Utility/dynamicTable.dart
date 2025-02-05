import 'package:flutter/material.dart';

Table buildDynamicTable({
  required int rows,
  required int columns,
  required List<List<String>> initialData,
  required List<List<TextEditingController?>> controllers,
  required List<List<bool>> isEditable,
  required List<List<Function(String)?>> onChanged,
}) {
  return Table(
    border: TableBorder.all(),
    columnWidths: {
      for (int i = 0; i < columns; i++) i: FlexColumnWidth(),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: List.generate(rows, (rowIndex) {
      return TableRow(
        children: List.generate(columns, (columnIndex) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: controllers[rowIndex][columnIndex] != null
                ? TextFormField(
                    controller: controllers[rowIndex][columnIndex],
                    onChanged: onChanged[rowIndex][columnIndex],
                    enabled: isEditable[rowIndex][columnIndex],
                    decoration: InputDecoration(
                      hintText: initialData[rowIndex][columnIndex],
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                : Container(),
          );
        }),
      );
    }),
  );
}
