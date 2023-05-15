import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login_register/login.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/image1.jpg"),
            ),
          ),

        ],
      ),
      nextScreen: LoginScreen(),
      duration: 2000,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      splashIconSize: 300,
    );
  }
}


