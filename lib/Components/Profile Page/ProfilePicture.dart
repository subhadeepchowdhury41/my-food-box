import 'package:flutter/material.dart';
import '../../Constants.dart' as Constants;

class Pfp extends StatelessWidget {
  final double radius;
  const Pfp({
    super.key, required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: Constants.PFPdefault,
      radius: radius,
    );
  }
}