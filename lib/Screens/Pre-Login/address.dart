import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import '../../Constants.dart' as Constants;
import 'MailVerify.dart';

class Adress extends StatefulWidget {
  const Adress({Key? key}) : super(key: key);

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  String value = 'City 1';
  String value2 = 'Cafe 1';
  var items = [
    'City 1',
    'City 2',
    'City 3',
    'City 4',
    'City 5',
  ];

  var Cafes = [
    'Cafe 1',
    'Cafe 2',
    'Cafe 3',
    'Cafe 4',
    'Cafe 5',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          // alignment: Alignment.topCenter,
          children: <Widget>[
            Image.asset(
              'assets/images/address/adress.png',
              // width: size.width * 1.2,
            ),
            const SizedBox(height: 10),
            Text(
              'Select City',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w400,
                color: Constants.Grey,
              ),
            ),
            Container(
              width: size.width * 0.8,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Constants.Grey,
              //   ),
              // ),
              padding: EdgeInsets.all(10),
              child: DropdownButton(
                  isExpanded: true,
                  value: value,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  }),
            ),
            const SizedBox(height: 10),
            Text(
              'Select Cafe',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w400,
                color: Constants.Grey,
              ),
            ),
            Container(
              width: size.width * 0.8,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Constants.Grey,
              //   ),
              // ),
              padding: EdgeInsets.all(10),
              child: DropdownButton(
                  isExpanded: true,
                  value: value2,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: Cafes.map((String Cafes) {
                    return DropdownMenuItem(
                      value: Cafes,
                      child: Text(Cafes),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      value2 = newValue!;
                    });
                  }),
            ),
            const SizedBox(height: 50),
            RoundedButton(
              color: Constants.dBlue,
              text: 'CONFIRM',
              textColor: Colors.white,
              length: size * 0.7,
              press: () {
                Get.to(() => mailVerify());
              },
              fontsize: size.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}