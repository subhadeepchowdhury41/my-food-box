import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:myfoodbox/Screens/Counter/MainCounters.dart';
import 'package:myfoodbox/Screens/Pre-Login/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
