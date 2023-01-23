import 'package:flutter/material.dart';

import 'backButton.dart';

class appBar extends StatelessWidget {
  const appBar({
    super.key,
    required this.size, required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        backButton(
          size: size,
        ),
        SizedBox(
          width: size.width * 0.1,
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: size.width * 0.07),
        ),
      ],
    );
  }
}