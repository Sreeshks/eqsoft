import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'EqSoft is a leading provider of IT solutions, specializing in web '
              'development, mobile app development, and custom software services. '
              'Our goal is to deliver innovative and tailored solutions to businesses '
              'of all sizes, helping them achieve their objectives with cutting-edge technology.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://www.eqsoftonline.com/images/logo.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
