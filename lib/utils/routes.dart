import 'package:belajar_flutter/screen/home_screen.dart';
import 'package:belajar_flutter/screen/onboarding_screen.dart';
import 'package:belajar_flutter/screen/ph_screen.dart';
import 'package:belajar_flutter/screen/temperature_screen.dart';

class Routes {
  static final route = {
    OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    PhScreen.routeName: (context) => const PhScreen(),
    TemperatureScreen.routeName: (context) => const TemperatureScreen(),
  };
}
