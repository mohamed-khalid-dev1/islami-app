import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/features/layout/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Splash Screen.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/islami_logo.png",
            height: 232,
            width: 173.72,
          ),
        ],
      ),
    );
  }
}
