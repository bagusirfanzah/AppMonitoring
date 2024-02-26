import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/detail_monitor.dart';
import 'package:belajar_flutter/widget/monitor.dart';
import 'package:flutter/material.dart';

class PhScreen extends StatelessWidget {
  const PhScreen({super.key});

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
                          text: "PH Monitoring",
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
                    child: CircleAvatar(
                        backgroundColor: darkgreyColor,
                        radius: 17,
                        child: Image.asset("assets/icons/icononoff.png",
                            scale: 25)),
                  )
                ],
              ),
              const SizedBox(height: 80),
              const Monitor(),
              const SizedBox(height: 50),
              const DetailMonitor()
            ],
          ),
        ),
      ),
    );
  }
}
