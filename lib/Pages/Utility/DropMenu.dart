import 'package:diacare360/Pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:diacare360/Pages/Drop%20Menu/Details.dart';
import 'package:diacare360/Pages/Drop%20Menu/Diet.dart';
import 'package:diacare360/Pages/Drop%20Menu/EducationModules.dart';
import 'package:diacare360/Pages/Drop%20Menu/Excercise.dart';
import 'package:diacare360/Pages/Drop%20Menu/Medications.dart';
import 'package:provider/provider.dart';
import 'package:diacare360/Pages/State/selectedIndex.dart';
import 'package:diacare360/Pages/Drop%20Menu/bloodGlucose.dart';

/// This widget is the drop menu that contains the menu items and links all pages to it.
class Dropmenu extends StatelessWidget {
  const Dropmenu({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);

    // Responsive text style for the menu items
    TextStyle menuTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.04, // Scales with device width
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06, // Scales with device width
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildMenuItem(
            context,
            title: "Home Page",
            isSelected: selectedIndexProvider.selectedIndex == 0,
            onTap: () {
              selectedIndexProvider.selectedIndex = 0;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            textStyle: menuTextStyle,
          ),
          _buildMenuItem(
            context,
            title: "Anthropometric Details",
            isSelected: selectedIndexProvider.selectedIndex == 1,
            onTap: () {
              selectedIndexProvider.selectedIndex = 1;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Details()),
              );
            },
            textStyle: menuTextStyle,
          ),
          _buildMenuItem(
            context,
            title: "Blood Glucose",
            isSelected: selectedIndexProvider.selectedIndex == 2,
            onTap: () {
              selectedIndexProvider.selectedIndex = 2;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BloodGlucose()),
              );
            },
            textStyle: menuTextStyle,
          ),
          _buildMenuItem(
            context,
            title: "Exercise and Mindfulness",
            isSelected: selectedIndexProvider.selectedIndex == 3,
            onTap: () {
              selectedIndexProvider.selectedIndex = 3;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Excercise()),
              );
            },
            textStyle: menuTextStyle,
          ),
          _buildMenuItem(
            context,
            title: "Medication",
            isSelected: selectedIndexProvider.selectedIndex == 4,
            onTap: () {
              selectedIndexProvider.selectedIndex = 4;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Medications()),
              );
            },
            textStyle: menuTextStyle,
          ),
          _buildMenuItem(
            context,
            title: "Diet",
            isSelected: selectedIndexProvider.selectedIndex == 5,
            onTap: () {
              selectedIndexProvider.selectedIndex = 5;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Diet()),
              );
            },
            textStyle: menuTextStyle,
          ),
          _buildMenuItem(
            context,
            title: "Education Modules",
            isSelected: selectedIndexProvider.selectedIndex == 6,
            onTap: () {
              selectedIndexProvider.selectedIndex = 6;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Educationmodules(),
                ),
              );
            },
            textStyle: menuTextStyle,
          ),
        ],
      ),
    );
  }

  /// Helper method to build a menu item with responsive text style.
  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required TextStyle textStyle,
  }) {
    return ListTile(
      title: Text(
        title,
        style: textStyle,
      ),
      selected: isSelected,
      onTap: onTap,
    );
  }
}
