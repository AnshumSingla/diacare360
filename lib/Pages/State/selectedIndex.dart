import 'package:flutter/material.dart';
//This file records and preserves the selected item in the drop menu
class SelectedIndexProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
