import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/Home.dart';
import '../../../Constants.dart' as Constants;
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  HomeController homeController = Get.find();

  @override@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: AppBar().preferredSize.height,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Settings",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              // Divider(
              //   endIndent: 50,
              //   indent: 50,
              //   height: 0,
              //   color: Colors.black,
              // ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image(
                      image: AssetImage('assets/images/Wishlist/emptyWishlist.png'),
                      width: size.width * 0.3,
                    ),
                    const SizedBox(height: 20),
                    Text('There is nothing in your wishlist',),
                    const SizedBox(height: 100),
                    RoundedButton(
                      text: 'Order Now',
                      press: () {
                        homeController.bottomNavIndex.value = 0;
                        Get.offAll(() => Home());
                      },
                      color: Constants.dBlue,
                      textColor: Colors.white,
                      length: size * 0.85,
                      fontsize: size.width * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
