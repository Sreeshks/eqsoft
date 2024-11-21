import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {

  // Function to open URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Email: eqsoftkerala@gmail.com'),
          SizedBox(height: 5),
          Text('Phone: +91 99460 17660'),
          SizedBox(height: 5),
          Text('Address:Round North, Thrissur, Kerala 680021'),
          SizedBox(height: 20),

          // Social Media Icons
          Row(
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.facebook),
                onPressed: () => _launchURL('https://www.facebook.com/eqsoftIndia'),
              ),
          
              IconButton(
                icon: FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => _launchURL('https://www.linkedin.com/in/eqsoftindia/'),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.x),
                onPressed: () => _launchURL('https://x.com/eqsoftkerala?mx=2'),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.youtube),
                onPressed: () => _launchURL('https://www.youtube.com/c/EqsoftIndia'),
              ),
            ],
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              // Add action for navigation or contact form
            },
            child: Text('Send Us a Message'),
          ),
        ],
      ),
    );
  }
}
