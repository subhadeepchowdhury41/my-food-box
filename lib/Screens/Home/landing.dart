import 'package:flutter/material.dart';

import '../../Components/Profile Page/ProfilePicture.dart';

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
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.location_on_rounded,
                        size: 30,
                        color: Color(0xff0077B5),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Color(0xff868686),
                      ),
                      iconSize: MediaQuery.of(context).size.width * 0.08,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.messenger,
                        size: 30,
                        color: Color(0xff868686),
                      ),
                      iconSize: MediaQuery.of(context).size.width * 0.08,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.027,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child:
                          Pfp(radius: MediaQuery.of(context).size.width * 0.07),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Image.asset(
                "assets/images/Profile/image123.png",
                height: 175,
                width: MediaQuery.of(context).size.width * 1.75,
              ),
              const SizedBox(height: 30),
              //SCAN AND GO
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    height: 75,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      color: Color(0xffDEEDF6),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Scan and Go",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Scan Any retail item",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
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
              const SizedBox(height: 20),
              //DINE IN
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    height: 75,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      color: Color(0xffDEEDF6),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
                                  fontSize: 15,
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
              const SizedBox(height: 20),
              //TAKE AWAY
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    height: 75,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      color: Color(0xffDEEDF6),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
                                  fontSize: 15,
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
            ],
          ),
        ),
      ),
    );
  }
}
