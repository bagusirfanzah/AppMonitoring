// ignore_for_file: dead_code

import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';

class AppMonitoring extends StatelessWidget {
  
  final dynamic image;
  final AppText text;
  final AppText detailText;
  final VoidCallback ontap;
  const AppMonitoring({
    super.key,
    required this.ontap,
    required this.image,
    required this.text,
    required this.detailText,
  });

  @override
  Widget build(BuildContext context) {
    bool ison = true;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: 120,
        width: size.width/2.3,
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/icons/iconsuhu.png"),
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
                  children: [text, detailText],
                ),
                CircleAvatar(
                  backgroundColor: ison? Colors.red : Colors.white,
                  radius: 15,
                  child: image
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
