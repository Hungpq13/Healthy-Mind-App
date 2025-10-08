import 'package:flutter/material.dart';

class InformationUserWidget extends StatefulWidget {
  const InformationUserWidget({super.key});

  @override
  State<InformationUserWidget> createState() => _InformationUserWidgetState();
}

class _InformationUserWidgetState extends State<InformationUserWidget> {
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
            Text('This is the user screen.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
