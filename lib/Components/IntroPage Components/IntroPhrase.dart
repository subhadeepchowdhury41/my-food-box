import 'package:flutter/material.dart';

class IntroPhrase extends StatelessWidget {
  const IntroPhrase({
    super.key,
    required this.size, required this.phrase,
  });

  final Size size;
  final String phrase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.75,
      child: Text(
        phrase,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w400,
          fontSize: size.width * 0.04,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
      ),
    );
  }
}
