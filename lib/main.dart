import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Screens/Home/landing.dart';
import 'package:myfoodbox/Screens/Intro/Intro-1.dart';
import 'Screens/Intro/GetStarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home:Landing(),
      home: Intro1(),
    );
  }
}
