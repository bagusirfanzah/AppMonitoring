// import 'package:belajar_flutter/screen/home_screen.dart';
// import 'package:belajar_flutter/widget/intro_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:lottie/lottie.dart';

import 'package:belajar_flutter/screen/home_screen.dart';
import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen extends StatefulWidget {
  static const routeName = "/oboarding_screen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
//final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          //   child: PageView.builder(
          // scrollDirection: Axis.vertical,
          // itemCount: images.length,
          // itemBuilder: (_, index) {
          //   return Container(
          //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          //     width: double.maxFinite,
          //     height: double.maxFinite,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("assets/images/${images[index]}"),
          //       ),
          //     ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            margin: const EdgeInsets.only(top: 50),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //LottieBuilder.asset("assets/lottie/monitor.json"),
                Image.asset("assets/images/monitoring.png"),
                const SizedBox(height: 50),
                const Text(
                  "APP",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "MONITORING",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Aplikasi ini digunakan untuk memonitoring fermentasi kopi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: blueColor,
                        gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      blueColor,
                      purpleColor,
                    ],),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: AppText(
                          text: "Lanjut",
                          color: whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // )),
  //     body: Stack(
  //       children: [
  //   PageView(
  //     controller: _controller,
  //     onPageChanged: (index) {
  //       setState(() {
  //         onLastPage = (index == 2);
  //       });
  //     },
  //     children: [
  //       IntroPage(images: Image.asset('assets/images/firsticon.png')),
  //       IntroPage(images: Image.asset('assets/images/firsticon.png')),
  //       IntroPage(images: Image.asset('assets/images/firsticon.png')),
  //     ],
  //   ),
  //   Container(
  //       alignment: const Alignment(0, 0.80),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           // Skip
  //           GestureDetector(
  //             onTap: () {
  //               _controller.jumpToPage(2);
  //             },
  //             child: const Text(
  //               'SKIP',
  //               style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),

  //           // dot indicator
  //           SmoothPageIndicator(
  //               controller: _controller,
  //               count: 3,
  //               effect: const WormEffect()),

  //           // next or done
  //           onLastPage
  //               ? GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(context,
  //                         MaterialPageRoute(builder: (context) {
  //                       return const HomeScreen();
  //                     }));
  //                   },
  //                   child: const Text(
  //                     'DONE',
  //                     style: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 )
  //               : GestureDetector(
  //                   onTap: () {
  //                     _controller.nextPage(
  //                       duration: const Duration(milliseconds: 500),
  //                       curve: Curves.easeIn,
  //                     );
  //                   },
  //                   child: const Text(
  //                     'NEXT',
  //                     style: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //         ],
  //       ))
  // ])
}
