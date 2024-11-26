import 'package:eqsoft/pages/api_service.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'pages/services_page.dart';
import 'pages/gallery_page.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart'; // Import HomePage
import 'pages/contact_page.dart'; // Import ContactPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EqSoft Business Solutions',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    HomePage(),
    ServicesPage(),
    GalleryPage(),
    AboutPage(),
    ContactPage(),
    api()
  ];

  // Method to handle navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40, // Set height for the animation
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'EqSoft Business Solutions',
                textStyle: TextStyle(
                  fontSize: 22.0, // Adjusted for better readability
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                speed: Duration(milliseconds: 100), // Typing speed
              ),
              FadeAnimatedText(
                'Innovate Your Business',
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
                duration: Duration(milliseconds: 2000), // Fade duration
              ),
              RotateAnimatedText(
                'Grow with Us!',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                duration: Duration(milliseconds: 1500),
              ),
            ],
            repeatForever: true,
            pause: Duration(milliseconds: 500), // Pause between animations
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black, // Black background for the nav bar
        selectedItemColor: Colors.red, // Red color for the selected item
        unselectedItemColor: Colors.white70, // Light color for unselected items
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.red),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services_outlined),
            activeIcon: Icon(Icons.design_services, color: Colors.red),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            activeIcon: Icon(Icons.image, color: Colors.red),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            activeIcon: Icon(Icons.info, color: Colors.red),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            activeIcon: Icon(Icons.contact_page, color: Colors.red),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            activeIcon: Icon(Icons.api, color: Colors.red),
            label: 'api data',
          ),
        ],
      ),
    );
  }
}
