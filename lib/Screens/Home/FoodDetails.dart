import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Controller/home_controller.dart';

import '../../Components/Profile Page/ProfilePicture.dart';
import '../../Constants.dart';
import 'BottomNavBar/AddToCart.dart';
import 'BottomNavBar/profileScreen.dart';
import 'MessageScreen.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  HomeController homeController = Get.find();

  final List<String> similarItemsImage = [
    "assets/images/address/img1.png",
    "assets/images/address/img2.png",
    "assets/images/address/img3.png",
    "assets/images/address/img1.png",
    "assets/images/address/img2.png",
    "assets/images/address/img3.png",
    "assets/images/address/img1.png",
    "assets/images/address/img2.png",
    "assets/images/address/img3.png",
    "assets/images/address/img1.png",
    "assets/images/address/img2.png",
    "assets/images/address/img3.png",
    // "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80",
    // "https://images.unsplash.com/photo-1426869981800-95ebf51ce900?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1528279027-68f0d7fce9f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80",
    // "https://images.unsplash.com/photo-1426869981800-95ebf51ce900?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1528279027-68f0d7fce9f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80",
    // "https://images.unsplash.com/photo-1426869981800-95ebf51ce900?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1528279027-68f0d7fce9f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80",
    // "https://images.unsplash.com/photo-1426869981800-95ebf51ce900?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    // "https://images.unsplash.com/photo-1528279027-68f0d7fce9f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightBackground,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   height: AppBar().preferredSize.height,
              //   width: size.width,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           Get.back();
              //         },
              //         child: Container(
              //           height: 40,
              //           width: 40,
              //           child: Icon(
              //             Icons.arrow_back_sharp,
              //             color: Colors.black,
              //             // color: Color(0xff868686),
              //           ),
              //         ),
              //       ),
              //       Row(
              //         children: [
              //           Container(
              //             height: 50,
              //             width: 50,
              //             child: Icon(
              //               Icons.search,
              //               size: 30,
              //               color: Color(0xff868686),
              //             ),
              //           ),
              //           Container(
              //             height: 50,
              //             width: 50,
              //             child: Icon(
              //               Icons.messenger,
              //               size: 30,
              //               color: Color(0xff868686),
              //             ),
              //           ),
              //           Container(
              //             height: 45,
              //             width: 45,
              //             child: Image(
              //               image: AssetImage(
              //                   "assets/images/Profile/PFPdefault.png"),
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              Obx(() {
                return Container(
                  width: size.width - 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      homeController.isSearching.value
                          ? Expanded(
                              child: Container(
                                height: 35,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: Icon(
                                          Icons.arrow_back_sharp,
                                          size: size.width * 0.06,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          label: Text(
                                            "Search Items",
                                            style: GoogleFonts.openSans(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  size: size.width * 0.06,
                                ),
                              ),
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
                                    color: iconBlack
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
                              width: MediaQuery.of(context).size.width * 0.03),
                          IconButton(
                            onPressed: () {
                              Get.to(() => const MessageScreen());
                            },
                            icon: const Icon(Icons.messenger),
                            iconSize: size.width * 0.06,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
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
              Expanded(
                // padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Container(
                        //   height: 225,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: NetworkImage(
                        //           "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.7dVRWoiw1S3xZUcAEvCxVQHaFE%26pid%3DApi&f=1&ipt=3e0b17e4c78ae0845046dcb4add73dcb6ce3e509e79679294b6365b3502887b2&ipo=images"),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          // color: Colors.white,
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/address/food_card.png"),
                                        // image: NetworkImage(
                                        //     "https://images.unsplash.com/photo-1602253057119-44d745d9b860?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1452&q=80"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    left: 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                                                  color:textBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: iconBlack,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Dishes Name",
                                            style: TextStyle(
                                              color: textBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee_sharp,
                                                color: iconBlack,
                                                size: 14,
                                              ),
                                              Text(
                                                "60",
                                                style: TextStyle(
                                                  color: textBlack,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Short description",
                                          style: TextStyle(
                                            color: Color(0xff6C6969),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          "40%off 100",
                                          style: TextStyle(
                                            color: Color(0xff73CE5C),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 125,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                height: 20,
                                                width: 20,
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Good | 80 ratings",
                                          style: TextStyle(
                                            color: Color(0xff868686),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Ratings & Reviews",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "View all",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 20,
                                              child: Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color: Color(0xff0077B5),
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 125,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                height: 20,
                                                width: 20,
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "80 ratings and 10 reviews",
                                          style: TextStyle(
                                            color: Color(0xff868686),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 125,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                height: 20,
                                                width: 20,
                                                margin: const EdgeInsets.only(
                                                    right: 5),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Excellent",
                                          style: TextStyle(
                                            color: Color(0xff868686),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "So yummy!",
                                      style: TextStyle(
                                        color: Color(0xff868686),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Piu Mondal, abcd",
                                      style: TextStyle(
                                        color: Color(0xff868686),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xff73CE5C),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Verified Purchase",
                                          style: TextStyle(
                                            color: Color(0xff868686),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

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
                                'Similar  Items',
                                style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   "Similar  Items",
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.w600,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        Container(
                          height: (similarItemsImage.length / 3 * 132) + 100,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: similarItemsImage.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 19.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white,
                                ),
                                // color: Colors.white,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              similarItemsImage[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Dishes name",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, -2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const AddToCart());
                      },
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xff0077B5),
                      child: Center(
                        child: Text(
                          "ORDER NOW",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
