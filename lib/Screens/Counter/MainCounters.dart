import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../Home/BottomNavBar/Home.dart';

class MainCounters extends StatefulWidget {
  const MainCounters({Key? key}) : super(key: key);

  @override
  State<MainCounters> createState() => _MainCountersState();
}

class _MainCountersState extends State<MainCounters> {
  final List<String> sliderImages = [
    "assets/images/address/img1.png",
    "assets/images/address/img2.png",
    "assets/images/address/img3.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width * 0.95,
                  child: CarouselSlider(
                    items: sliderImages
                        .map(
                          (item) => Stack(
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
                      height: size.height * 0.25,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 3,
                        color: Colors.red,
                        margin: const EdgeInsets.only(left: 15),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Food Counters",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 3,
                        color: Colors.red,
                        margin: const EdgeInsets.only(right: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 0.8),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Get.to(()=> Home());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(sliderImages[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      "Food Counter A",
                                      style: GoogleFonts.openSans(
                                        color: Colors.black,
                                      ),
                                    )),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        "CLOSED",
                                        style: GoogleFonts.openSans(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
