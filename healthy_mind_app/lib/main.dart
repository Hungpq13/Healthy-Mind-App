import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:healthy_mind_app/repository/auth_repository.dart';
import 'package:healthy_mind_app/widgets/main_app.dart';
import 'firebase_options.dart'; // Import file vừa tạo

void main() async {
  // Đảm bảo Flutter đã được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();
  // Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AuthRepository authRepository = AuthRepository();
  authRepository.signIn(email: "admin@gm.com", password: "123456");
  authRepository.signOut();
  runApp(const MainApp());
}
