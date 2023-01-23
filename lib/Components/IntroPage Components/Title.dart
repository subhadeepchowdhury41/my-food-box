import 'package:flutter/material.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title, //Seamless Tracking of your Order
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontSize: size.width * 0.06,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
    );
  }
}