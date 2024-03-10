import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class DetailMonitor extends StatelessWidget {
  final String text;
  final String textStatus;
  const DetailMonitor({
    super.key,
    required this.text, required this.textStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: darkgreyColor),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            transform: GradientRotation(4),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [blackColor, darkgreyColor1, blackColor],
          )),
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(color: greyColor),
          ),
          const SizedBox(height: 15),
          Text(
            textStatus,
            style: const TextStyle(color: greyColor),
          )
        ],
      ),
    );
  }
}
