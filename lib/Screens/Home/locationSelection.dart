import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Screens/Home/landing.dart';

class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LocationSelectionScreen> createState() =>
      _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  String locationValue = 'Location 1';
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
    String dropDownStatevalue = 'KARNATAKA';

    // List of items in our dropdown menu
    var state = [
      'KARNATAKA',
      'Tamil Nadu',
    ];

    String dropDownCityvalue = 'Bangalore';
    var city = [
      'Bangalore',
      'Tamil Nadu',
    ];
    String dropDownCafevalue = 'Client Location 1';
    var cafe = [
      'Client Location 1',
      'Client Location 2',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: AppBar().preferredSize.height,
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Select Location",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    // Container(
                    //   width: 400,
                    //   child:
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: size.width - 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Select State",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: DropdownButton(
                              value: dropDownStatevalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: state.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownStatevalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: size.width - 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Select State",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: DropdownButton(
                              value: dropDownCityvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: city.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownCityvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: size.width - 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Select Cafeteria",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: DropdownButton(
                              value: dropDownCafevalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: cafe.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropDownCafevalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_box,
                            color: Colors.red,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Set this as Default",
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: (){
                        Get.to(()=> const Landing());
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
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
