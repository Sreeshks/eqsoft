import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Our Services',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ServiceTile(
          title: 'Web Development',
          description: 'Professional web development services for your business needs.',
        ),
        ServiceTile(
          title: 'Mobile App Development',
          description: 'We create sleek and functional mobile apps for iOS and Android.',
        ),
        ServiceTile(
          title: 'IT Solutions',
          description: 'Custom IT solutions to streamline your business processes.',
        ),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final String description;

  const ServiceTile({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(description),
          ],
        ),
      ),
    );
  }
}
