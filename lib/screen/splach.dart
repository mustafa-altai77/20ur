import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twenty_r/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "images/splash.png",
        fit: BoxFit.cover,
        height: double.infinity,
      ),
    );
  }
}
