import 'package:flutter/material.dart';
import '../Constants.dart' as Constants;

class DualButton extends StatelessWidget {
  const DualButton({
    super.key,
    required this.size,
    required this.press_1,
    required this.press_2,
  });

  final Size size;
  final Function() press_1;
  final Function() press_2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //ClipRRect(
        //borderRadius: BorderRadius.only(
        //  topLeft: Radius.circular(15),
        //bottomLeft: Radius.circular(15)),
        //child:
        Container(
          height: size.height * 0.07,
          width: size.width * 0.5,
          //color: (mode=='login')?Color(0xff2b2c7f):Color(0xffe6e6e6),
          color: Constants.dBlue,
          child: TextButton(
            onPressed: press_1,
            child: Text(
              'Resend Link',
              style: TextStyle(
                //color: (mode=='login')?Color(0xffffffff):Color(0xff000000),
                color: Colors.white,
                fontSize: size.width * 0.045,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //),
        ),
        SizedBox(
          width: size.width * 0.001,
        ),
        //ClipRRect(
        //borderRadius: BorderRadius.only(
        //  topRight: Radius.circular(15),
        //bottomRight: Radius.circular(15)),
        //      child:
        Container(
          height: size.height * 0.07,
          width: size.width * 0.5,
          //color: (mode=='login')?Color(0xffe6e6e6):Color(0xff2b2c7f),
          color: Constants.dBlue,
          child: TextButton(
            onPressed: press_2,
            child: Text(
              'Change Email',
              style: TextStyle(
                //color: (mode=='login')?Color(0xff000000):Color(0xffffffff),
                color: Colors.white,
                fontSize: size.width * 0.045,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        //)
      ],
    );
  }
}
