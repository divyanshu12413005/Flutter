import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  String message = 'Press any button to see the result.';
  int favoriteCount = 0;

  void updateMessage(String newMessage) {
    setState(() {
      message = newMessage;
    });
  }

  void increaseFavorite() {
    setState(() {
      favoriteCount++;
      message = 'IconButton clicked $favoriteCount time(s).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons in Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                updateMessage('ElevatedButton clicked.');
              },
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 20),
            Center(
              child: IconButton(
                onPressed: increaseFavorite,
                icon: const Icon(Icons.favorite),
                color: Colors.red,
                iconSize: 40,
                tooltip: 'IconButton',
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                updateMessage('TextButton clicked.');
              },
              child: const Text(
                'TextButton',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
