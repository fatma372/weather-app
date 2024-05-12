import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobilecomputing/view/Splash2.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: 
    Expanded(
      child:
          Center(
            child: LottieBuilder.asset("assets/Animation - 1714077249514.json"),
          )
    )
     ,nextScreen: Splash2()
     ,splashIconSize: 300,
     backgroundColor: Colors.white,
     );
  }
}