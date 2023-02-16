import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/Home.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/profileScreen.dart';
import 'package:myfoodbox/Screens/Home/QRScreen.dart';
import '../../Components/Profile Page/ProfilePicture.dart';
import '../Counter/MainCounters.dart';
import 'MessageScreen.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String location_value = 'Location 1';
  var locations = [
    'Location 1',
    'Location 2',
    'Location 3',
    'Location 4',
    'Location 5'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                        DropdownButton(
                          value: location_value,
                          items: locations.map((String locations) {
                            return DropdownMenuItem(
                              value: locations,
                              child: Text(locations),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              location_value = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => const MessageScreen());
                          },
                          icon: const Icon(
                            Icons.messenger,
                            size: 30,
                            color: Color(0xff868686),
                          ),
                          iconSize: MediaQuery.of(context).size.width * 0.08,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const ProfileScreen(close: true,));
                          },
                          child:
                          Pfp(radius: MediaQuery.of(context).size.width * 0.05),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 35),
                    Image.asset(
                      "assets/images/Profile/image123.png",
                      height: 175,
                      width: MediaQuery.of(context).size.width * 1.75,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container
                          const SizedBox(height: 20),
                          //SCAN AND GO
                          InkWell(
                            onTap: () {
                              Get.to(() => QRScreen());
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  height: 77,
                                  width: MediaQuery.of(context).size.width - 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffDEEDF6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Scan and Go",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Scan Any retail item",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * 0.027,
                                                color: Color(0xff595F62),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffBEF4B0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/images/Profile/image 121.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          //DINE IN
                          InkWell(
                            onTap: () {
                              Get.to(() => MainCounters());
                              // Get.to(() => Home());
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  height: 77,
                                  width: MediaQuery.of(context).size.width - 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffDEEDF6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Dine In",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Order through the app,delivered straight to your table",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * 0.027,
                                                color: Color(0xff595F62),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFBD8B8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/images/Profile/image 120.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          //TAKE AWAY
                          InkWell(
                            onTap: () {
                              Get.to(() => Home());
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  height: 77,
                                  width: MediaQuery.of(context).size.width - 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffDEEDF6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Delivery",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Order your favorite on campus food for delivery",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * 0.026,
                                                color: Color(0xff595F62),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFCE5EE),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/images/Profile/image 122.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
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
