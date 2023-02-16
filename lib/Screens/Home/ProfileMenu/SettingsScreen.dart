import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
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
                child: Center(
                  child: Text("Setting Page is Coming Soon..."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
