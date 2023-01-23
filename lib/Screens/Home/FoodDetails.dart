import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: AppBar().preferredSize.height,
                width: size.width,
                color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.location_pin,
                        color: Color(0xff0077B5),
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
