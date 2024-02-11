import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final dynamic images;
  
  const IntroPage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 145, 197, 253),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            images
          ],
        ))
              
         
    );
  }
}
