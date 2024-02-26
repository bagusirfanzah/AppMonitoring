import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class DetailMonitor extends StatelessWidget {
  const DetailMonitor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: darkgreyColor),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            transform: GradientRotation(4),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [blackColor, darkgreyColor1, blackColor],
          )),
    );
  }
}
