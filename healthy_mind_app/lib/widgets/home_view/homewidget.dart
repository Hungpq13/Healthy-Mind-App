import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Healthy Mind App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('This is the home screen.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
