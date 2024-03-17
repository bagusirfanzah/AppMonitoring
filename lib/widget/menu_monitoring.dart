import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';

// import 'package:belajar_flutter/widget/button.dart';

class MenuMonitoring extends StatefulWidget {
  final ImageProvider imageBackground;
  final dynamic image;
  final AppText text;
  final AppText detailText;
  final VoidCallback ontap;
  final VoidCallback ontapbutton;
  const MenuMonitoring(
      {super.key,
      required this.text,
      required this.detailText,
      required this.ontap,
      required this.ontapbutton,
      required this.imageBackground,
      this.image});

  @override
  State<MenuMonitoring> createState() => _MenuMonitoringState();
}

class _MenuMonitoringState extends State<MenuMonitoring> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: 120,
        width: size.width / 2.3,
        decoration: BoxDecoration(
            gradient: isClick
                ? const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      darkgreyColor3,
                      blackColor,
                      blackColor,
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      blackColor,
                      blackColor,
                    ],
                  ),
            color: blackColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: isClick? darkblueColor : darkgreyColor )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isClick
                ? Image(
                    image: widget.imageBackground,
                    height: 60,
                    width: 60,
                    color: blueColor,
                  )
                : Image(
                    image: widget.imageBackground,
                    height: 60,
                    width: 60,
                  ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [widget.text, widget.detailText],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isClick = !isClick;
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 7),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: isClick
                              ? const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    blueColor,
                                    purpleColor,
                                  ],
                                )
                              : const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    darkgreyColor,
                                    lightgreyColor,
                                  ],
                                )),
                      child: Image.asset(
                        "assets/icons/icononoff.png",
                        scale: 30,
                      )),
                )
                // Button( onTap: (){},image: widget.image) : Button( onTap: () {},image: widget.image)
              ],
            )
          ],
        ),
      ),
    );
  }
}
