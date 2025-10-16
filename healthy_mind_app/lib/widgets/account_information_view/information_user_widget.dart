import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'package:healthy_mind_app/widgets/login_view/login_widget.dart';

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
                onPressed: () async {
                  final authRepository = context.read<AuthRepository>();
                  await authRepository.signOut();
                  if (!mounted) return;
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginWidget()),
                  );
                },
                child: const Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}
