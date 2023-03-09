// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Constants.dart' as Constants;

class formField extends StatelessWidget {
  final String text;
  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  const formField({
    Key? key,
    required this.text,
    this.formKey,
    this.validator,
    this.controller,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 0.07, 0, size.width * 0.07, 0),
      child: TextFormField(
        controller: controller,
        key: formKey,
        validator: validator,
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
