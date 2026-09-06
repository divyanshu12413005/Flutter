import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Examples'),
        backgroundColor: Colors.blue,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Text Widget Deep Dive',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 24),
            Text(
              'This text uses styling: color, font size, font weight, letter spacing, and font family.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.yellow,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This text is center aligned so you can see how textAlign works inside a Text widget.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This is a very long text line that will not fit properly on the screen, so overflow is used to show dots at the end.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This paragraph is limited to only two lines. Even if the text is longer, Flutter will stop it after maxLines and show fade overflow.',
              maxLines: 2,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
