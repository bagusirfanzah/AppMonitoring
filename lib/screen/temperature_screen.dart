import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/monitor.dart';
import 'package:flutter/material.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Image.asset("assets/icons/iconback.png", scale: 15)),
                  Image.asset("assets/icons/iconmenu.png", scale: 15)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Temperature Monitoring",
                          color: whiteColor,
                          fontSize: 20),
                      SizedBox(height: 5),
                      AppText(
                          text: "Details Setting",
                          color: greyColor,
                          fontSize: 13)
                    ],
                  ),
                  InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  blueColor,
                                  purpleColor,
                                ],
                              )),
                          child: Image.asset("assets/icons/icononoff.png",
                              scale: 25)))
                ],
              ),
              const SizedBox(height: 100),
              const Monitor()
            ],
          ),
        ),
      ),
    );
  }
}
