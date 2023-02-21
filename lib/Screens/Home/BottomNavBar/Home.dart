import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfoodbox/Components/Profile%20Page/ProfilePicture.dart';
import 'package:myfoodbox/Screens/Home/FoodDetails.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/profile.dart';

import '../../../Constants.dart';
import '../../../Controller/home_controller.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String locationValue = 'Location 1';
  var locations = [
    'Location 1',
    'Location 2',
    'Location 3',
    'Location 4',
    'Location 5'
  ];

  final List<String> sliderImages = [
    "assets/images/address/img1.png",
    "assets/images/address/img2.png",
    "assets/images/address/img3.png",
    // "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80",
    // "https://images.unsplash.com/photo-1426869981800-95ebf51ce900?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1528279027-68f0d7fce9f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  ];

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: lightBackground,
        body: IndexedStack(
          index: homeController.bottomNavIndex.value,
          children: homeController.bottomNavigationPages,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0, vertical: 10.0),
            child: GNav(
              selectedIndex: homeController.bottomNavIndex.value,
              tabs: homeController.iconsList,
              padding: const EdgeInsets.all(12.0),
              gap: 10.0,
              onTabChange: (index) {
                homeController.changePage(index);
              },
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.red,
            ),
          ),
        ),
        // bottomNavigationBar: BottomNav(size: size),
        // bottomNavigationBar: BottomNavigationBar(
        //   selectedItemColor: Color(0xff0B3131),
        //   backgroundColor: Colors.black,
        //   unselectedItemColor: Colors.grey.shade700,
        //   currentIndex: homeController.homeIndex.value,
        //   onTap: (value) {
        //     homeController.homeIndex.value = value;
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.history_sharp),
        //       label: "History",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.shopping_cart),
        //       label: "Cart",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: "Profile",
        //     ),
        //   ],
        // ),
      );
    });
  }

  Widget foodCard(BuildContext context, int index) {
    Size size = MediaQuery
        .of(context)
        .size;

    return InkWell(
      onTap: () {
        Get.to(() => const FoodDetails());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 370,
        padding: const EdgeInsets.all(10),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/address/food_card.png"),
                      // image: NetworkImage(
                      //     "https://images.unsplash.com/photo-1602253057119-44d745d9b860?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1452&q=80"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "4.2",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: size.width,
                          child: Text(
                            "American Food Salad",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Near You",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee_sharp,
                                    color: Colors.black,
                                    size: 13,
                                  ),
                                  Text(
                                    "112",
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: size.width * 0.06,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black54,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black54,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.restaurant_menu,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Text(
                              "Fruit and Meals Cafeteria",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: size.width * 0.047,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.black,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
