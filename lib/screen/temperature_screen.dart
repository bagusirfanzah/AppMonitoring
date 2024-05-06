import 'package:belajar_flutter/screen/home_screen.dart';
import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/button.dart';
// import 'package:belajar_flutter/widget/button.dart';
import 'package:belajar_flutter/widget/detail_monitor.dart';
import 'package:belajar_flutter/widget/monitor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemperatureScreen extends StatefulWidget {
  static const routeName = 'temperature_screen';

  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  bool isClick = false;

  void isOn() {
    setState(() {
      isClick = !isClick;
    });
  }

  void setPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isclick', isClick);
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isclick') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.routeName);
                      },
                      child:
                          Image.asset("assets/icons/iconback.png", scale: 15)),
                  InkWell(
                      onTap: () {},
                      child: const Icon(Icons.refresh,
                          color: whiteColor, size: 25))
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Temperature Monitoring",
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                      SizedBox(height: 5),
                      AppText(
                          text: "Details Setting",
                          color: greyColor,
                          fontSize: 13,
                          fontWeight: FontWeight.normal)
                    ],
                  ),
                  Button(
                      image: const AssetImage('assets/icons/icononoff.png'),
                     isclick: isClick,
                      onTap: () {
                        isOn();
                        
                      }),
                      
                  // InkWell(
                  //   onTap: () {
                  //     isOn();
                  //   },
                  //   child: Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           vertical: 7, horizontal: 7),
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           gradient: isclick
                  //               ? const LinearGradient(
                  //                   begin: Alignment.centerLeft,
                  //                   end: Alignment.centerRight,
                  //                   colors: [
                  //                     blueColor,
                  //                     purpleColor,
                  //                   ],
                  //                 )
                  //               : const LinearGradient(
                  //                   begin: Alignment.centerLeft,
                  //                   end: Alignment.centerRight,
                  //                   colors: [
                  //                     darkgreyColor,
                  //                     lightgreyColor,
                  //                   ],
                  //                 )),
                  //       child: Image.asset(
                  //         "assets/icons/icononoff.png",
                  //         scale: 25,
                  //       )),
                  // )
                ],
              ),
              const SizedBox(height: 80),
              Monitor(isClick: isClick, textMonitor: "°C"),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailMonitor(
                    isClick: isClick,
                    text: "Temperature Status ",
                    textStatus: "Normal",
                  ),
                  DetailMonitor(
                    isClick: isClick,
                    text: "Current Status",
                    textStatus: "36°C",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
