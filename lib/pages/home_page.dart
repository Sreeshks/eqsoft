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

  void _submitFeedback() {
    setState(() {
      _ratings.add(_currentRating);
      _averageRating = _ratings.reduce((a, b) => a + b) / _ratings.length;
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
                // Handle form submission here
                if (_nameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty &&
                    _fieldController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Details Submitted! Thank you.'),
                    ),
                  );
                  // Clear text fields and close the dialog
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Empower Your Business with Eqsoft Applications\n'
            'Software Solutions for Every Business Vertical',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.network(
            'data:image/jpeg;base64,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',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _showEnquiryDialog,
            child: Text('Enquire Now'),
          ),
          SizedBox(height: 20),
          Text(
            'Average Rating: ${_averageRating.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          RatingBar.builder(
            initialRating: _currentRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 40,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your feedback',
              ),
              onChanged: (value) {
                _feedbackMessage = value;
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _feedbackMessage.isNotEmpty
                ? _submitFeedback
                : null, // Disable button if no feedback
            child: Text('Submit Feedback'),
          ),
        ],
      ),
    );
  }
}
