import 'package:flutter/material.dart';
import '../Constants.dart' as Constants;

class backButton extends StatelessWidget {
  final Size size;
  const backButton({
    super.key, required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.arrow_back_sharp),
        onPressed: () {Navigator.pop(context);},
        iconSize: size.width * 0.08,
      ),
    );
  }
}