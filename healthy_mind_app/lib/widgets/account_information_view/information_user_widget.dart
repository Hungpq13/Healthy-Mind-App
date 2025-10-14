import 'package:flutter/material.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';

class InformationUserWidget extends StatefulWidget {
  const InformationUserWidget({super.key});

  @override
  State<InformationUserWidget> createState() => _InformationUserWidgetState();
}

class _InformationUserWidgetState extends State<InformationUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Healthy Mind App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('This is the user screen.',
                style: TextStyle(fontSize: 16)),
            ElevatedButton(
                onPressed: () {
                  AuthRepository authRepository = AuthRepository();
                  authRepository.signOut();
                },
                child: const Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}
