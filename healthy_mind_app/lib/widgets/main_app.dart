import 'package:flutter/material.dart';
import 'package:healthy_mind_app/config/theme.dart';
import 'package:healthy_mind_app/widgets/bottom_navigation/bottom_custom.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: const BottomCustomNav(),
    );
  }
}
