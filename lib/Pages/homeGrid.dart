import 'package:diacare360/Pages/homePageGrid/Details.dart';
import 'package:diacare360/Pages/homePageGrid/Diet.dart';
import 'package:diacare360/Pages/homePageGrid/EducationModules.dart';
import 'package:diacare360/Pages/homePageGrid/Excercise.dart';
import 'package:diacare360/Pages/homePageGrid/Medications.dart';
import 'package:diacare360/Pages/homePageGrid/bloodGlucose.dart';
import 'package:flutter/material.dart';

class homeGrid extends StatefulWidget {
  const homeGrid({super.key});

  @override
  State<homeGrid> createState() => _homeGrid();
}

class _homeGrid extends State<homeGrid> {
  final List<String> items = List.generate(6, (index) => "Item $index");
  final List<String> images = [
    'assets/images/edit.jpg',
    'assets/images/blood.jpg',
    'assets/images/exercise.jpg',
    'assets/images/medication.jpg',
    'assets/images/diet.jpg',
    'assets/images/book.jpg'
  ];
  final List<Widget> pages = [
    Details(),
    BloodGlucose(),
    Excercise(),
    Medications(),
    Diet(),
    Educationmodules()
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: EdgeInsets.all(screenWidth * 0.04),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: screenWidth * 0.03,
        crossAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Colors.transparent), // Removing the shadow
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            pages[index], // Use the page from the list
                      ),
                    );
                  },
                  child: Image.asset(
                    images[index],
                    width: 160,
                    height: 160,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
