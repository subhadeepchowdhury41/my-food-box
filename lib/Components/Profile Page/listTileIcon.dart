import 'package:flutter/material.dart';
import '../../Constants.dart' as Constants;

class listTileIcon extends StatelessWidget {
  final Size size;
  final IconData icon;
  final Color fillColor;
  final Color iconColor;

  const listTileIcon(
      {Key? key,
      required this.size,
      required this.icon,
      required this.fillColor,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        onPressed: () {},
        //elevation: 2.0,
        fillColor: fillColor,
        child: Icon(
          icon,
          color: iconColor,
          size: size.width * 0.06,
        ),
        //padding: EdgeInsets.all(size.width * 0.02),
        shape: CircleBorder(),
      ),
    );
  }
}
