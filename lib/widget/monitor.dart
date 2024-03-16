import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Monitor extends StatelessWidget {
  const Monitor({
    super.key,
    required this.isClick, 
    required this.textMonitor,
  });

  final bool isClick;
  final String textMonitor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: greyColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: greyColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: isClick ? blueColor : blackColor,
                      blurRadius: 100),
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
                      trackColor: lightgreyColor,
                      dotColor: whiteColor,
                      progressBarColors: [
                        purpleColor,
                        blueColor,
                        purpleColor
                      ],
                    ),
                    customWidths: CustomSliderWidths(
                      trackWidth: 10,
                      progressBarWidth: 12,
                      handlerSize: 6,
                    )),
                onChange: (value) {},
                innerWidget: (double percentage) {
                  return Container(
                    margin: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: blackColor,
                            blurRadius: 20,
                            spreadRadius: 5),
                      ],
                      color: darkgreyColor3,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30),
                              child: AppText(
                                  text: "${percentage.toInt()}",
                                  color: isClick
                                      ? whiteColor
                                      : greyColor2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: AppText(
                                  text: textMonitor,
                                  color: greyColor2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                isClick ? Colors.green : Colors.red,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 4,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: greyColor,
              ),
            ),
          ],
        ),
        Container(
          height: 10,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
