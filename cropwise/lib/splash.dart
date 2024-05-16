import 'package:cropwise/main.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: 
    Column( children: [ 
      Center(
        child: LottieBuilder.asset("assets/Animation-1.json",fit: BoxFit.fill,),
      )
    ],), nextScreen: const MyHomePage(),
    splashIconSize: 600,
    backgroundColor: Color.fromARGB(255, 109, 159, 248),);
  }
}