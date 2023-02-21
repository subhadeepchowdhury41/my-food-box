import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Constants.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FinalOrder extends StatefulWidget {
  const FinalOrder({Key? key}) : super(key: key);

  @override
  State<FinalOrder> createState() => _FinalOrderState();
}

class _FinalOrderState extends State<FinalOrder> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 50,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: size.width,
                      child: Center(
                        child: Text(
                          "Order Details",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: iconBlack,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Id",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  color: textBlack,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "41524612",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  color: textBlack,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    QrImage(
                      data: "Rs. 400",
                      size: size.width * 0.4,
                      version: QrVersions.auto,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Scanned Result",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.green.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          "widget.code",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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
    });
  }
}
