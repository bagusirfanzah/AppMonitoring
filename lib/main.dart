import 'package:belajar_flutter/screen/onboarding_screen.dart';
import 'package:belajar_flutter/utils/routes.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
      routes: Routes.route,
    );
  }
}
