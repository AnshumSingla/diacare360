import 'package:diacare360/Pages/homeGrid.dart';
import 'package:flutter/material.dart';
import 'package:diacare360/Pages/profilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Home Page",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/user.jpg',
              width: screenWidth*.1,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profilePage()),
                );
              },
            ),
          ],
        ),
        body: homeGrid());
  }
}
