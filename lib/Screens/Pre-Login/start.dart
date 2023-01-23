import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Screens/Pre-Login/LogIn.dart';
import 'package:myfoodbox/Screens/Pre-Login/Signup.dart';
import '../../Components/LogoWidget.dart';
import '../../Constants.dart' as Constants;

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * 0.2,
            child: Logo(
              radius: 80,
            ),
          ),
          Positioned(
            top: size.height * 0.43,
            child: Container(
              width: size.width * 0.75,
              child: Text(
                'Order your favourite meal from your seat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.041,
                  color: Constants.dBlue,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.465,
            child: Container(
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
          ),
          Positioned(
            top: size.height * 0.6,
            child: RoundedButton(
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              textColor: Colors.white,
              text: 'SIGN UP',
              color: Constants.dBlue,
              length: size * 0.85,
              fontsize: size.width * 0.06,
            ),
          ),
          Positioned(
            top: size.height * 0.68,
            child: RoundedButton(
              press: () {},
              textColor: Colors.white,
              text: 'LOG IN WITH OTP',
              color: Constants.dBlue,
              length: size * 0.85,
              fontsize: size.width * 0.06,
            ),
          ),
          Positioned(
            top: size.height * 0.76,
            child: RoundedButton(
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              textColor: Colors.white,
              text: 'LOG IN',
              color: Constants.dBlue,
              length: size * 0.85,
              fontsize: size.width * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
