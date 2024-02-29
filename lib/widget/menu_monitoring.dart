import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/button.dart';
import 'package:flutter/material.dart';

class AppMonitoring extends StatefulWidget {
    final dynamic image;
    final AppText text;
    final AppText detailText;
    final VoidCallback ontap;
    final VoidCallback ontapbutton;
  const AppMonitoring({
    super.key, 
    required this.text, 
    required this.detailText, 
    required this.ontap, 
    required this.ontapbutton, 
    required this.image});

  @override
  State<AppMonitoring> createState() => _AppMonitoringState();
}

class _AppMonitoringState extends State<AppMonitoring> {
  bool isOn = false;
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
                children: [widget.text, widget.detailText],
              ),
              Button(image: widget.image)
              
            ],
          )
        ],
      ),
    ),
  );
  }
}
