import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Monitor extends StatelessWidget {
  const Monitor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: blueColor, blurRadius: 100, spreadRadius: 15),
        ],
        color: blackColor,
        shape: BoxShape.circle,
      ),
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          startAngle: 90,
            size: 200,
            customColors: CustomSliderColors(
              trackColor: darkgreyColor,
              dotColor: whiteColor,
              progressBarColor: purpleColor,
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 10,
              progressBarWidth: 12,
              handlerSize: 4,
            )),
        onChange: (value) {},
      ),
    );
  }
}
