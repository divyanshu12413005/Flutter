import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Examples'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Images from Assets',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/IMG-20251029-WA0059.jpg',
              height: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Image.asset(
              'assets/images/IMG-20251029-WA0061.jpg',
              height: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Image.asset(
              'assets/images/IMG-20251029-WA0063.jpg',
              height: 180,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
