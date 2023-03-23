import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:myfoodbox/Screens/Home/landing.dart';
import 'package:myfoodbox/Screens/Pre-Login/MailVerify.dart';
import 'package:myfoodbox/Screens/Pre-Login/start.dart';
import 'package:myfoodbox/Services/LocalDBServices.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  final homeController = Get.put(HomeController());

  Future<void> _init() async {
    await LocalDBServices.getUserId().then((uid) async {
      print(uid);
      if (uid != null && uid != '') {
        await LocalDBServices.getVerificationStatus().then((value) {
          if (value == null || value) {
            homeController.id = uid;
            Get.to(Landing());
          } else {
            Get.to(mailVerify());
          } 
        });
        
      } else {
        Get.to(StartPage());
      }
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('efreshfoods',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}