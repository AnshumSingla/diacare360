import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: screenWidth * 0.2,
            ),
            Image.asset(
              'assets/images/user.jpg',
              width: screenWidth * 0.6,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 3),
              ),
              margin: EdgeInsets.all(screenWidth*.05),
              padding: EdgeInsets.all(screenWidth*.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  profile('User', 34, 'Male', 'PGI', 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text profile(
      String name, int age, String gender, String hospital, int duration) {
    return Text(
      'Name: $name\nAge: $age\nGender: $gender\nHospital: $hospital\nDuration: $duration months',
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}
