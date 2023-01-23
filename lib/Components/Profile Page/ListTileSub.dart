import 'package:flutter/material.dart';
import '../../Constants.dart' as Constants;
import 'listTileIcon.dart';

class ListTileSub extends StatelessWidget {
  const ListTileSub({
    super.key,
    required this.size, required this.prefixIcon, required this.suffixIcon, required this.title,
  });

  final Size size;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width*0.8,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(child: listTileIcon(size: size, icon: prefixIcon, fillColor: Constants.dBlue, iconColor: Colors.white,)),
          SizedBox(width: size.width*0.06,),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(width: size.width*0.1,),
          Expanded(child: Icon(suffixIcon,size: size.width*0.08,)),
        ],
      ),
    );
  }
}