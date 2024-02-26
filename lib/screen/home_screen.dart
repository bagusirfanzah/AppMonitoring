import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/menu_monitoring.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                const AppText(
                    text: "SMART MONITORING", color: whiteColor, fontSize: 16),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset("assets/icons/icondevice.png", scale: 15),
                    const SizedBox(width: 10),
                    const AppText(
                        text: 'Parameters', color: whiteColor, fontSize: 16),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    appMonitoring(
                      context: context,
                      text: const AppText(text: "pH Monitor",color: whiteColor, fontSize: 16),
                      detailText: const AppText(text: "Details Setting", color: greyColor, fontSize: 12),
                      ontap: () {},
                      ontapbutton: (){},
                      image: Image.asset("assets/icons/icononoff.png", scale: 25)),
                    appMonitoring(
                      context: context,
                      text: const AppText(text: "Suhu Monitor", color: whiteColor, fontSize: 16),
                      detailText: const AppText(text: "Details Setting",color: greyColor,fontSize: 12),
                      ontap: () {},
                      ontapbutton: (){},
                      image:Image.asset("assets/icons/icononoff.png", scale: 25),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
