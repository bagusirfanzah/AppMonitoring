import 'package:belajar_flutter/screen/home_screen.dart';
import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:belajar_flutter/widget/button.dart';
// import 'package:belajar_flutter/widget/button.dart';
import 'package:belajar_flutter/widget/detail_monitor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:belajar_flutter/widget/monitor.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PhScreen extends StatefulWidget {
  static const routeName = 'ph_screen';

  const PhScreen({super.key});

  @override
  State<PhScreen> createState() => _PhScreenState();
}

class _PhScreenState extends State<PhScreen> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  String realtime = '0';
  bool isclick = false;

  void isOn() {
    setState(() {
      isclick = !isclick;
    });
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
                        child: Image.asset("assets/icons/iconback.png",
                            scale: 15)),
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
                            text: "PH Monitoring",
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
                        isclick: isclick,
                        onTap: () {
                          isOn();
                        }),
                  ],
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    Container(
                      height: 10,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: greyColor,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        height: 4,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: greyColor,
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder(
                            future: _fApp,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('ERROR');
                              } else if (snapshot.hasData) {
                                return phLayout(isclick: isclick);
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                      ),
                    ]),
                    Container(
                      height: 4,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                  width: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: greyColor,
                  ),
                ),
              ],
            ),
            // Monitor(
            //   isClick: isClick,
            //   textMonitor: "pH",
            // ),
            // const SizedBox(height: 100),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         DetailMonitor(
            //           isClick: isclick,
            //           text: "PH Status",
            //           textStatus: "Normal",
            //         ),
            //         DetailMonitor(
            //           isClick: isclick,
            //           text: "Current Status",
            //           textStatus: "7 pH",
            //         )
            //       ],
            //     ),

            // ),
          ),
        ));
  }

  Widget phLayout() {
    DatabaseReference dref =
        FirebaseDatabase.instance.ref('monitoring').child('Ph');
    dref.onValue.listen((event) {
      setState(() {
        realtime = event.snapshot.value.toString();
      });
    });
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: isclick ? blueColor : blackColor, blurRadius: 100),
        ],
        color: darkgreyColor3,
        shape: BoxShape.circle,
      ),
      child: SleekCircularSlider(
        initialValue: 0,
        appearance: CircularSliderAppearance(
            startAngle: 90,
            size: 200,
            customColors: CustomSliderColors(
              trackColor: lightgreyColor,
              dotColor: whiteColor,
              progressBarColors: isclick
                  ? <Color>[purpleColor, blueColor, purpleColor]
                  : <Color>[
                      darkblueColor,
                      darkblueColor,
                    ],
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 10,
              progressBarWidth: 12,
              handlerSize: 6,
            )),
        onChange: (dref) {
                  setState(() {
                    realtime.toString();
                  });
                },
        innerWidget: (double percentage) {
          return Container(
            margin: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(color: blackColor, blurRadius: 20, spreadRadius: 5),
              ],
              color: darkgreyColor3,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: AppText(
                          text: realtime.toString(),
                          color: isclick ? whiteColor : greyColor2,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 35),
                      child: Text(
                        'Ph',
                        style: TextStyle(
                            color: greyColor2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isclick ? Colors.green : Colors.red,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
