import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentRating = 5.0; // Default rating
  String _feedbackMessage = ''; // Customer feedback message
  List<double> _ratings = []; // Store submitted ratings
  double _averageRating = 0.0; // Average rating

  // Variables for the enquiry dialog
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();

  bool _isFeedbackSubmitted = false; // Track if feedback is submitted

  @override
  void initState() {
    super.initState();
  }

  void _submitFeedback() {
    setState(() {
      _ratings.add(_currentRating);
      _averageRating = _ratings.reduce((a, b) => a + b) / _ratings.length;
      _isFeedbackSubmitted = true; // Mark feedback as submitted
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Thank you for your feedback!')),
    );
  }

  void _showEnquiryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enquire Now'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _fieldController,
                decoration: InputDecoration(labelText: 'Field of Interest'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty &&
                    _fieldController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Details Submitted! Thank you.'),
                    ),
                  );
                  _nameController.clear();
                  _phoneController.clear();
                  _fieldController.clear();
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all fields.'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background animation with gradient color change
          AnimatedContainer(
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.greenAccent, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.5, 0.8],
              ),
            ),
            child: SizedBox.expand(),
          ),
          // Main content with smooth animation
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                AnimatedDefaultTextStyle(
                  duration: Duration(seconds: 1),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: Text(
                    'Empower Your Business with Eqsoft Applications\n'
                    'Software Solutions for Every Business Vertical',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Image.network(
                    'https://your-image-url-here.com',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                // Latest News Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        'Latest News',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'New Software Update Released',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                'We have launched a new update for our software, with improved features and bug fixes.',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            Divider(color: Colors.white30),
                            ListTile(
                              title: Text(
                                'Partnering with Industry Leaders',
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                'We are excited to announce our new partnership with leading tech companies.',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40), // Space between Latest News and Feedback section

                // Feedback Section
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Column(
                    children: [
                      // Rating Section
                      RatingBar.builder(
                        initialRating: _currentRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _currentRating = rating;
                          });
                        },
                      ),
                      SizedBox(height: 20),

                      // Feedback Text Field
                      !_isFeedbackSubmitted
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    _feedbackMessage = text;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Leave your feedback',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                            )
                          : Container(), // Hide feedback input after submission

                      SizedBox(height: 20),

                      // Submit Button
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: ElevatedButton(
                          onPressed: _submitFeedback,
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 142, 176, 39), // Complementary color to the background
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Submit Feedback'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Enquire Button
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: ElevatedButton(
                    onPressed: _showEnquiryDialog,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent, // Complementary color to the background
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Enquire Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
