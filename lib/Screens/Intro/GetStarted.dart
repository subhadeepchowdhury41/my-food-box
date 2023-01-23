import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Screens/Pre-Login/Open.dart';
import 'package:myfoodbox/Screens/Pre-Login/start.dart';
import '../../../Constants.dart' as Constants;

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xfffdfdfd),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: size.height * 0.15,
              child: Text(
                'LOREM IPSUM DOLOR SIT',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: size.width * 0.06,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              )),
          Positioned(
            top: size.height * 0.2,
            child: Image.asset(
              'assets/images/GetStarted/GetStartedImg.png',
              height: size.height * 0.4,
            ),
          ),
          Positioned(
              top: size.height * 0.66,
              child: Container(
                width: size.width * 0.75,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    fontSize: size.width * 0.04,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              )),
          Positioned(
              bottom: size.height * 0.1,
              child: RoundedButton(
                text: 'Get Started',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartPage()));
                },
                color: Constants.dBlue,
                textColor: Colors.white,
                length: size * 0.85, fontsize: 25,
              )),
          Positioned(
            bottom: size.height * 0.05,
            child: Container(
              width: size.width * 0.9,
              child: Text(
                'By proceeding you calim to agree to out Privacy Poilcy in accordance to our Terms and Services',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: size.width * 0.027,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
