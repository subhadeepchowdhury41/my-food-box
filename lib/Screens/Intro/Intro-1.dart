import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/PageIndicator.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import '../../Constants.dart' as Constants;
import '../../Components/IntroPage Components/IntroPhrase.dart';
import '../../Components/IntroPage Components/Title.dart';
import 'Intro-2.dart';

class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

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
              child: IntroTitle(
                size: size,
                title: 'Timely Delivery of Food',
              )),
          Positioned(
            top: size.height * 0.22,
            child: Image.asset(
              'assets/images/Intro/Intro1.png',
              height: size.height * 0.4,
            ),
          ),
          Positioned(
              top: size.height * 0.66,
              child: IntroPhrase(
                size: size,
                phrase:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              )),
          Positioned(
              bottom: size.height * 0.14,
              child: PageIndicator(
                size: size * 0.05,
                page: 1,
              )),
          Positioned(
              bottom: size.height * 0.06,
              child: RoundedButton(
                text: 'NEXT',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Intro2()));
                },
                color: Constants.dBlue,
                textColor: Colors.white,
                length: size * 0.35, fontsize: 25,
              )),
        ],
      ),
    );
  }
}
