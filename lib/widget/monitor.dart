import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Monitor extends StatelessWidget {
  final String textMonitor;

  const Monitor({
    super.key, required this.textMonitor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: blueColor, blurRadius: 100),
        ],
        color: darkgreyColor3,
        shape: BoxShape.circle,
      ),
      child: SleekCircularSlider(
        initialValue: 0,
        appearance: CircularSliderAppearance(
            startAngle: 90,
            size: 200,
            customColors: CustomSliderColors(
              trackColor: darkgreyColor,
              dotColor: whiteColor,
              progressBarColors: [purpleColor, blueColor, purpleColor],
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 10,
              progressBarWidth: 12,
              handlerSize: 6,
            )),
        onChange: (value) {},
        innerWidget: (double percentage) {
          return Container(
            margin: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(color: blackColor, blurRadius: 20, spreadRadius: 5),
              ],
              color: darkgreyColor3,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: AppText(
                      text: "${percentage.toInt()}",
                      color: whiteColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: AppText(text: textMonitor, color: greyColor2, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
