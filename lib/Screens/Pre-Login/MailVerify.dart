import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/DualButton.dart';
import 'package:myfoodbox/Screens/Pre-Login/start.dart';
import '../../Constants.dart' as Constants;

class mailVerify extends StatelessWidget {
  const mailVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: size.height * 0.25,
            child: Image.asset(
              'assets/images/mailVerify/mailVerify.png',
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: size.height * 0.45,
            child: Text(
              'Please verify your email address',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.05,
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.52,
            child: Container(
              width: size.width * 0.7,
              child: Text(
                'Enter the OTP sent to your email account',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.035,
                  decoration: TextDecoration.none,
                  color: Constants.Grey,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: DualButton(
                size: size,
                press_1: () {},
                press_2: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>StartPage()));},
              ))
        ],
      ),
    );
  }
}
