import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twenty_r/screen/home_menu.dart';
import 'package:twenty_r/screen/home_screen_section.dart';
import 'package:twenty_r/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeMenu(),
    );
  }
}
