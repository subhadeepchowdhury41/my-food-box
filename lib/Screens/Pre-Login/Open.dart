import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import '../../Constants.dart' as Constants;

class OpenPage extends StatelessWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * 0.38,
            child: RoundedButton(
              press: () {},
              color: Colors.white,
              textColor: Constants.dBlue,
              length: size * 0.8,
              text: 'Enter Company Code/E-Mail',
              borderColor: Constants.dBlue,
              fontsize: 20,
            ),
          ),
          Positioned(
            top: size.height * 0.48,
            child: const Text(
              'OR',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                decoration: TextDecoration.none,
                color: Constants.dBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: size.height*0.38,
              child: RoundedButton(
            color: Constants.dBlue,
            text: 'SCAN QR CODE',
            textColor: Colors.white,
            length: size * 0.8,
            fontsize: 18,
            press: () {},
          ))
        ],
      ),
    );
  }
}
