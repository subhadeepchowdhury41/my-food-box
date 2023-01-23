import 'package:flutter/material.dart';
import '../Constants.dart' as Constants;

class Logo extends StatelessWidget {
  final double radius;
  const Logo({
    super.key, required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: Constants.logo,
      radius: radius,
    );
  }
}