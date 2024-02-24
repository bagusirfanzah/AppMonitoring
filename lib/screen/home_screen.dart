import 'package:belajar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Scaffold(
          backgroundColor: Colors.black,
           body: Column(
        children: [
          const Text("SMART MONITORING", style: TextStyle(color: whiteColor, fontSize: 16)),
          const SizedBox(height: 15),
          Row(
            children: [
              Image.asset("assets/icons/icondevice.png", scale: 15),
              const SizedBox(width: 10),
              const Text("Parameters",style: TextStyle(color: whiteColor, fontSize: 16),)
            ],
          )
        ],
           )
        
           ),
      ),
      );
    
  }
}
