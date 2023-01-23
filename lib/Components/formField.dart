import 'package:flutter/material.dart';
import '../Constants.dart' as Constants;

class formField extends StatelessWidget {
  final String text;
  const formField({
    super.key,
    required this.size, required this.text,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 0.07, 0, size.width * 0.07, 0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(
              color: Constants.Grey,
              fontSize: size.width * 0.04,
              fontFamily: 'Poppins',
            )),
      ),
    );
  }
}