import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Components/Profile%20Page/ProfilePicture.dart';
import 'package:myfoodbox/Components/Profile%20Page/listTileIcon.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Screens/Home/Breakfast.dart';
import 'package:myfoodbox/Screens/Home/FoodDetails.dart';
import 'package:myfoodbox/Screens/UserProfile/profile.dart';
import '../../Components/HomePage/BottomNav.dart';
import '../../Components/HomePage/CounterCard.dart';
import '../../Components/HomePage/DishRecommendation.dart';
import '../../Constants.dart' as Constants;

class Home extends StatefulWidget {
  var uid;

  Home({Key? key, required this.uid}) : super(key: key);

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
    "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2848&q=80",
    "https://images.unsplash.com/photo-1426869981800-95ebf51ce900?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "https://images.unsplash.com/photo-1528279027-68f0d7fce9f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width - 30,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_rounded,
                        size: size.width * 0.08,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
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
                      SizedBox(
                        width: size.width * 0.15,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        iconSize: size.width * 0.08,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.messenger),
                        iconSize: size.width * 0.08,
                      ),
                      SizedBox(
                        width: size.width * 0.027,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const Profile());
                        },
                        child: Pfp(radius: size.width * 0.07),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

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
                  child: Text(
                    'Trending Items',
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 30),

                CarouselSlider(
                  items: sliderImages
                      .map(
                        (item) => Container(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: size.width - 100,
                            height: 400,
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    height: 180,
                    enlargeCenterPage: true,
                  ),
                ),

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

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'All Counter Around You',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                InkWell(
                  onTap: (){
                    Get.to(() => const FoodDetails());
                  },
                  child: CounterCard(
                    size: size,
                    image:
                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.7dVRWoiw1S3xZUcAEvCxVQHaFE%26pid%3DApi&f=1&ipt=3e0b17e4c78ae0845046dcb4add73dcb6ce3e509e79679294b6365b3502887b2&ipo=images',
                    counterName: 'Counter 1',
                    dishName: 'Dish Name',
                    desc: '310+ orders placed from here recently',
                    rating: '4.1',
                    price: '₹100',
                  ),
                ),
                SizedBox(height: 20),


                CounterCard(
                  size: size,
                  image:
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.0VL8cvqqxpJyToFwAupCNgHaEU%26pid%3DApi&f=1&ipt=7d5dc5aa61ac0f8aa6cc98ef66c1a25e02b84d32059d9c69df7d197f8402299b&ipo=images',
                  counterName: 'Counter 1',
                  dishName: 'Dish Name',
                  desc: '310+ orders placed from here recently',
                  rating: '4.1',
                  price: '₹100',
                ),
                SizedBox(height: 20),

                CounterCard(
                  size: size,
                  image:
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.eKRcna3P-uGZNTQWwxPNrwHaEK%26pid%3DApi&f=1&ipt=c35c095bf76449a39e50de429cb5267f9ce69024357271ccad325cf90e4418e8&ipo=images',
                  counterName: 'Counter 1',
                  dishName: 'Dish Name',
                  desc: '310+ orders placed from here recently',
                  rating: '4.1',
                  price: '₹100',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(size: size),
    );
  }
}