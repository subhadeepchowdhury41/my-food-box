import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/AppBar.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import '../../../Constants.dart' as Constants;

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: size.height * 0.07,
        ),
        appBar(size: size, text: 'WishList'),
        SizedBox(
          height: size.height * 0.25,
        ),
        Image(
          image: AssetImage('assets/images/Wishlist/emptyWishlist.png'),
          width: size.width * 0.4,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          'There is nothing in your wishlist',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontFamily: 'Nerko One',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: size.height * 0.2,
        ),
        RoundedButton(
          text: 'Order Now',
          press: () {},
          color: Constants.dBlue,
          textColor: Colors.white,
          length: size * 0.85,
          fontsize: size.width * 0.07,
        ),
      ],
    ));
  }
}
