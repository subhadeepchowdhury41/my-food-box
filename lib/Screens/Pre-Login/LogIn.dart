import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:myfoodbox/Screens/Home/landing.dart';

import '../../Components/RoundedButton.dart';
import '../../Components/formField.dart';
import '../../Constants.dart' as Constants;
import '../Home/locationSelection.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool show = false;
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    show = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          // alignment: Alignment.topCenter,
          children: <Widget>[
            Image.asset(
              'assets/images/LogIn/LogIn.png',
              width: size.width,
            ),
            formField(
              size: size,
              text: 'Email Id',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.07, 0, size.width * 0.07, 0),
              child: TextFormField(
                obscureText: show,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Icon(
                      show ? Icons.visibility : Icons.visibility_off,
                      color: Constants.Grey,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Constants.Grey,
                    fontSize: size.width * 0.04,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              // height: size.height * 0.08,
              child: RoundedButton(
                text: 'LOGIN',
                press: () {
                  homeController.bottomNavIndex.value = 0;
                  // Get.to(()=> const Landing());
                  Get.to(()=> const LocationSelectionScreen());
                },
                color: Constants.dBlue,
                textColor: Colors.white,
                length: size * 0.7,
                fontsize: size.width * 0.05,
              ),
            )
          ],
        ),
      ),
    );
  }
}
