// import 'package:belajar_flutter/screen/home_screen.dart';
// import 'package:belajar_flutter/widget/intro_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:lottie/lottie.dart';

import 'package:belajar_flutter/screen/home_screen.dart';
import 'package:belajar_flutter/utils/colors.dart';
import 'package:belajar_flutter/widget/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "/oboarding_screen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ValueNotifier userCredential = ValueNotifier('');
  bool onLastPage = false;

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (googleUser != null) {}

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      ('exception->$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context).width;
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
                      color: blueColor,
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
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                const Expanded(child: SizedBox()),
                ValueListenableBuilder(
                    valueListenable: userCredential,
                    builder: (context, value, child) {
                      return (userCredential.value == '' ||
                              userCredential.value == null)
                          ? GestureDetector(
                              onTap: () async {
                                userCredential.value = await signInWithGoogle();
                                // if (userCredential.value != null)
                                //   print(userCredential.value.user!.email);
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                      color: blueColor,
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          blueColor,
                                          purpleColor,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: AppText(
                                        text: "Masuk",
                                        color: whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  )))
                          : Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                  
                                    children: [
                                      const AppText(
                                          text: "Welcome, ",
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      Text(
                                        userCredential.value.user!.displayName
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                       SizedBox(
                                        width: size/3.4,
                                      ),
                                      // Text(userCredential.value.user!.email
                                      //     .toString()),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomeScreen()));
                                        },
                                        child: Container(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 16),
                                            decoration: BoxDecoration(
                                                color: blueColor,
                                                gradient:
                                                    const LinearGradient(
                                                  begin:
                                                      Alignment.centerLeft,
                                                  end:
                                                      Alignment.centerRight,
                                                  colors: [
                                                    blueColor,
                                                    purpleColor,
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)),
                                            child: const Icon(
                                              Icons.arrow_circle_right,
                                              color: Colors.white,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  )
                                  // Container(
                                  //   clipBehavior: Clip.antiAlias,
                                  //   decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //           width: 1.5, color: Colors.black54)),
                                  //   child: Image.network(
                                  //       userCredential.value.user!.photoURL.toString()),
                                  // ),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),

                                  // ElevatedButton(
                                  //     onPressed: () async {
                                  //       bool result = await signOutFromGoogle();
                                  //       if (result) userCredential.value = '';
                                  //     },
                                  //     child: const Text('Logout'))
                                ],
                              ),
                            );
                    }),
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
