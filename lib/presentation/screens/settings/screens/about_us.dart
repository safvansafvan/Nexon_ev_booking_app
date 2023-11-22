import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nexon Ev Car Booking',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Developed By Muhammed Safvan',
                style: TextStyle(fontStyle: FontStyle.italic)),
            Text('Version : 1.2'),
          ],
        ),
      ),
    );
  }
}
