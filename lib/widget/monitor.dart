import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class Monitor extends StatelessWidget {
  const Monitor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: blueColor,
              blurRadius: 100,
              spreadRadius: 15),
        ],
        color: blackColor,
        shape: BoxShape.circle,
        // gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   colors: [
        //     blueColor,
        //     purpleColor,
        //   ],
        // )
      ),
    );
  }
}
