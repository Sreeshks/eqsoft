import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        Image.network(
          'https://lh5.googleusercontent.com/p/AF1QipPP-ZTwZXkuPcvh3hf3pXlNZomuNkhBtkrVoddr=w442-h240-k-no',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://www.eqsoftonline.com/images/logo.png',
          fit: BoxFit.cover,
        ),
        // Add more images as needed
      ],
    );
  }
}
