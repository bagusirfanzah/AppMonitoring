import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final dynamic image;
  final VoidCallback onTap;

  const Button({super.key, required this.image, required this.onTap});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final bool isOn = false;
   bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                          scale: 25,
                        )),
                  );
  }
}
