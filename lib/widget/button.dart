import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final dynamic image;
  final VoidCallback onTap;
  final bool isclick;

  const Button({
    super.key,
    required this.image,
    required this.onTap,
    required this.isclick,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: widget.isclick
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
            scale: 25,
          )),
    );
  }
}
