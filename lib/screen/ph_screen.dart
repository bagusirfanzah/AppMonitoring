import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/button.dart';
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
                  const Icon(Icons.refresh, color: whiteColor, size: 25)
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
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      SizedBox(height: 5),
                      AppText(
                          text: "Details Setting",
                          color: greyColor,
                          fontSize: 13,
                          fontWeight: FontWeight.normal)
                    ],
                  ),
                  Button(
                      image: Image.asset(
                    "assets/icons/icononoff.png",
                    scale: 25,
                  )),
                ],
              ),
              const SizedBox(height: 80),
              const Monitor(
                textMonitor: "pH",
              ),
              const SizedBox(height: 50),
              const DetailMonitor(
                text: "PH Status",
                textStatus: "Normal",
              )
            ],
          ),
        ),
      ),
    );
  }
}
