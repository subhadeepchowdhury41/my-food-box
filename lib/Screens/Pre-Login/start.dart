import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Screens/Pre-Login/LogIn.dart';
import 'package:myfoodbox/Screens/Pre-Login/Signup.dart';
import '../../Components/LogoWidget.dart';
import 'package:get/get.dart';
import '../../Constants.dart' as Constants;

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        // alignment: Alignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Logo(
          //   radius: 80,
          // ),
          Container(
            height: size.width * 0.6,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/address/logo.png")
              )
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: size.width * 0.75,
            child: Text(
              'Order your favourite meal from your seat',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.045,
                color: Constants.dBlue,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: size.width * 0.75,
            child: Text(
              'Scan a Unique QR Code and enjoy your delicious meal',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                fontSize: size.width * 0.028,
                color: Constants.dBlue,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 50),
          RoundedButton(
            press: () {
              Get.to(() => const SignUpPage());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            textColor: Colors.white,
            text: 'SIGN UP',
            color: Constants.dBlue,
            length: size * 0.85,
            fontsize: size.width * 0.05,
          ),
          const SizedBox(height: 30),
          RoundedButton(
            press: () {},
            textColor: Colors.white,
            text: 'LOG IN WITH OTP',
            color: Constants.dBlue,
            length: size * 0.85,
            fontsize: size.width * 0.05,
          ),
          const SizedBox(height: 30),
          RoundedButton(
            press: () {
              Get.to(() => const LogIn());
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => LogIn()));
            },
            textColor: Colors.white,
            text: 'LOG IN',
            color: Constants.dBlue,
            length: size * 0.85,
            fontsize: size.width * 0.05,
          ),
        ],
      ),
    );
  }
}
