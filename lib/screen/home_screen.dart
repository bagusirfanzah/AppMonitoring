import 'package:belajar_flutter/screen/onboarding_screen.dart';
import 'package:belajar_flutter/screen/ph_screen.dart';
import 'package:belajar_flutter/screen/temperature_screen.dart';
import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/menu_monitoring.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            const AppText(
                text: "SMART MONITORING",
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            const SizedBox(height: 15),
            Row(
              children: [
                Image.asset("assets/icons/icondevice.png", scale: 15),
                const SizedBox(width: 10),
                const AppText(
                    text: 'Parameters',
                    color: whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                    const SizedBox(width: 150),
                IconButton(
                    onPressed: () {
                      handleSignOut();
                    },
                    icon: const Icon(
                      Icons.output_rounded,
                      
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MenuMonitoring(
                    imageBackground:
                        const AssetImage("assets/icons/iconph.png"),
                    text: const AppText(
                        text: "pH Monitor",
                        color: whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    detailText: const AppText(
                        text: "Details Setting",
                        color: greyColor,
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                    ontap: () {
                      Navigator.pushReplacementNamed(
                          context, PhScreen.routeName);
                    },
                    image:
                        Image.asset("assets/icons/icononoff.png", scale: 30)),
                MenuMonitoring(
                  imageBackground:
                      const AssetImage("assets/icons/iconsuhu.png"),
                  text: const AppText(
                      text: "Temp Monitor",
                      color: whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                  detailText: const AppText(
                      text: "Details Setting",
                      color: greyColor,
                      fontSize: 10,
                      fontWeight: FontWeight.normal),
                  ontap: () {
                    Navigator.pushReplacementNamed(
                        context, TemperatureScreen.routeName);
                  },
                  image: Image.asset("assets/icons/icononoff.png", scale: 30),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<dynamic> handleSignOut() async {
    setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();

    setState(() {
      isLoading = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        (Route<dynamic> route) => false);
  }
}
