import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';

class DetailMonitor extends StatelessWidget {
  final String text;
  final String textStatus;
   final bool isClick;
   
  const DetailMonitor({
    super.key,
    required this.text,
    required this.textStatus, required this.isClick,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width/2.3,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: isClick? darkblueColor : darkgreyColor),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            transform: GradientRotation(4),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [blackColor, darkgreyColor1, blackColor],
          )),
      child: Column(
        children: <Widget>[
          AppText(
              text: text,
              color: greyColor2,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 15),
          AppText(
              text: textStatus,
              color: isClick? whiteColor : blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
