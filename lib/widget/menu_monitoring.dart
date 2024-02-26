import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';

Widget appMonitoring(
    {bool isON = false,
    required dynamic image,
    required AppText text,
    required AppText detailText,
    required VoidCallback ontap,
    required VoidCallback ontapbutton,
    required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: 120,
      width: size.width / 2.3,
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              "assets/icons/iconph.png",
            ),
            alignment: Alignment.topLeft,
            scale: 20,
            opacity: 100,
          ),
          color: blackColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: darkgreyColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [text, detailText],
              ),
              InkWell(
                onTap: ontapbutton,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          blueColor,
                          purpleColor,
                        ],
                      )),
                  child: image,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
