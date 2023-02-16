import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/profileScreen.dart';
import 'package:myfoodbox/Screens/Home/MessageScreen.dart';

import '../../../Components/Profile Page/ProfilePicture.dart';
import 'profile.dart';
import '../FoodDetails.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
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
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(() {
                  return Container(
                    width: size.width - 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        homeController.isSearching.value
                            ? Expanded(
                          child: Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20),
                            height: 35,
                            child: TextFormField(
                              decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                label: Text(
                                  "Search Items",
                                  style: GoogleFonts.openSans(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                            : Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: size.width * 0.06,
                            ),
                            SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width *
                                    0.03),
                            DropdownButton(
                              value: locationValue,
                              items: locations.map((String locations) {
                                return DropdownMenuItem(
                                  value: locations,
                                  child: Text(locations),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  locationValue = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            homeController.isSearching.value
                                ? IconButton(
                              onPressed: () {
                                homeController.isSearching.value = false;
                              },
                              icon: const Icon(
                                Icons.close_sharp,
                                color: Colors.black,
                              ),
                              iconSize: size.width * 0.06,
                            )
                                : IconButton(
                              onPressed: () {
                                homeController.isSearching.value = true;
                              },
                              icon: const Icon(Icons.search),
                              iconSize: size.width * 0.06,
                            ),
                            SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03),
                            IconButton(
                              onPressed: () {
                                Get.to(() => const MessageScreen());
                              },
                              icon: const Icon(Icons.messenger),
                              iconSize: size.width * 0.06,
                            ),
                            SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ProfileScreen(close: true));
                              },
                              child: Pfp(radius: size.width * 0.045),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(height: size.height * 0.02),

                // SizedBox(
                //   height: size.height*0.05,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: <Widget>[
                //       RoundedButton(text: 'Breakfast', press: (){}, color: Constants.dBlue, textColor: Colors.white, length: size*0.4, fontsize: 25),
                //       RoundedButton(text: 'Breakfast', press: (){}, color: Constants.dBlue, textColor: Colors.white, length: size*0.4, fontsize: 25),
                //       RoundedButton(text: 'Breakfast', press: (){}, color: Constants.dBlue, textColor: Colors.white, length: size*0.4, fontsize: 25),
                //       RoundedButton(text: 'Breakfast', press: (){}, color: Constants.dBlue, textColor: Colors.white, length: size*0.4, fontsize: 25),
                //     ],
                //   ),
                // )
                // SizedBox(
                //   height: size.height * 0.04,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: meal.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Padding(
                //         padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                //         child: RoundedButton(
                //           text: meal[index],
                //           press: () {
                //             Get.to(() => const Breakfast());
                //           },
                //           color: Constants.dBlue,
                //           textColor: Colors.white,
                //           length: size * 0.3,
                //           fontsize: 20,
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * 0.02
                // ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_business_sharp,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Trending Items',
                        style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  // Text(
                  //   'Trending Items',
                  //   style: TextStyle(
                  //     fontSize: size.width * 0.06,
                  //     fontWeight: FontWeight.w600,
                  //     fontFamily: 'Inter',
                  //   ),
                  //   textAlign: TextAlign.left,
                  // ),
                ),
                SizedBox(height: 10),

                CarouselSlider(
                  items: sliderImages
                      .map(
                        (item) =>
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Veg HamBurger",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.1,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Always in Demand",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.035,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    height: size.height * 0.3,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(height: 20),

                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(6.0),
                //       child: Text(
                //         'Looking for something delicious?',
                //         style: TextStyle(
                //           fontSize: size.width * 0.05,
                //           fontWeight: FontWeight.w600,
                //           fontFamily: 'Inter',
                //         ),
                //         textAlign: TextAlign.left,
                //       ),
                //     ),
                //     Row(
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //       ],
                //     ),
                //
                //     Row(
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //       ],
                //     ),
                //
                //     Row(
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.all(9.0),
                //           child: DishRecommend(
                //             size: size,
                //             image:
                //             'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OvlSoamYzybaNiiWE0p8jQHaE8%26pid%3DApi&f=1&ipt=93fbd81489dea87e76b529be7ab32329753c81d181cd6b1b096993d36df4a7da&ipo=images',
                //             dishName: 'Dish Name',
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu_rounded,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'All Counter Around You',
                        style: GoogleFonts.roboto(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 10),

                Container(
                  height: 20 * 370 + 10,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: 20,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return foodCard(context, index);
                      }),
                ),

                // InkWell(
                //   onTap: () {
                //     Get.to(() => const FoodDetails());
                //   },
                //   child: CounterCard(
                //     size: size,
                //     image:
                //         'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.7dVRWoiw1S3xZUcAEvCxVQHaFE%26pid%3DApi&f=1&ipt=3e0b17e4c78ae0845046dcb4add73dcb6ce3e509e79679294b6365b3502887b2&ipo=images',
                //     counterName: 'Counter 1',
                //     dishName: 'Dish Name',
                //     desc: '310+ orders placed from here recently',
                //     rating: '4.1',
                //     price: '₹100',
                //   ),
                // ),
                // SizedBox(height: 20),
                //
                // InkWell(
                //   onTap: () {
                //     Get.to(() => const FoodDetails());
                //   },
                //   child: CounterCard(
                //     size: size,
                //     image:
                //         'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.0VL8cvqqxpJyToFwAupCNgHaEU%26pid%3DApi&f=1&ipt=7d5dc5aa61ac0f8aa6cc98ef66c1a25e02b84d32059d9c69df7d197f8402299b&ipo=images',
                //     counterName: 'Counter 1',
                //     dishName: 'Dish Name',
                //     desc: '310+ orders placed from here recently',
                //     rating: '4.1',
                //     price: '₹100',
                //   ),
                // ),
                // SizedBox(height: 20),
                //
                // InkWell(
                //   onTap: () {
                //     Get.to(() => const FoodDetails());
                //   },
                //   child: CounterCard(
                //     size: size,
                //     image:
                //         'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.eKRcna3P-uGZNTQWwxPNrwHaEK%26pid%3DApi&f=1&ipt=c35c095bf76449a39e50de429cb5267f9ce69024357271ccad325cf90e4418e8&ipo=images',
                //     counterName: 'Counter 1',
                //     dishName: 'Dish Name',
                //     desc: '310+ orders placed from here recently',
                //     rating: '4.1',
                //     price: '₹100',
                //   ),
                // ),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
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
