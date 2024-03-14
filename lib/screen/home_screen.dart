import 'package:belajar_flutter/screen/ph_screen.dart';
import 'package:belajar_flutter/screen/temperature_screen.dart';
import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/menu_monitoring.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> with TickerProviderStateMixin {
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
                    text: "SMART MONITORING", color: whiteColor, fontSize: 16, fontWeight: FontWeight.normal),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset("assets/icons/icondevice.png", scale: 15),
                    const SizedBox(width: 10),
                    const AppText(
                        text: 'Parameters', color: whiteColor, fontSize: 16, fontWeight: FontWeight.normal),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppMonitoring(
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
                          Navigator.pushReplacementNamed(context, PhScreen.routeName);
                        },
                        ontapbutton: () {},
                        image: Image.asset("assets/icons/icononoff.png",
                            scale: 30)),
                    AppMonitoring(
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
                        Navigator.pushReplacementNamed(context, TemperatureScreen.routeName);
                      },
                      ontapbutton: () {},
                      image:
                          Image.asset("assets/icons/icononoff.png", scale: 30),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
