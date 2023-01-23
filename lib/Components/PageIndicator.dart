import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.size,
    required this.page,
  });

  final int page ;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: (page == 1) ? Color(0xff2b2c7f) : Color(0xffd9d9d9),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: size.width * 0.2,
        ),
        Container(
          width: 15,
          height: 15,
          decoration:  BoxDecoration(
            color: (page == 2) ? Color(0xff2b2c7f) : Color(0xffd9d9d9),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: size.width * 0.2,
        ),
        Container(
          width: 15,
          height: 15,
          decoration:  BoxDecoration(
            color: (page == 3) ? Color(0xff2b2c7f) : Color(0xffd9d9d9),
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
