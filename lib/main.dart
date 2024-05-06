import 'dart:io';

import 'package:belajar_flutter/screen/onboarding_screen.dart';
import 'package:belajar_flutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAts1bravnhscVj5xV_6S0MScO5lSQHglc",
              appId: "1:105282085795:android:c0e1e0472f5feac7997016",
              messagingSenderId: "105282085795",
              projectId: "esp32-b3371"))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.getBool('isClick');
    });
  }

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
