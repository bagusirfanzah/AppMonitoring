import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final dynamic image;
  
  const Button({
    super.key, 
    required this.image
    });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isOn
                ?  const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      blueColor,
                      purpleColor,
                    ],
                  )
                :  const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      darkgreyColor,
                      lightgreyColor,
                    ],
                  )),
        child: widget.image,
      ),
    );
  }
}
