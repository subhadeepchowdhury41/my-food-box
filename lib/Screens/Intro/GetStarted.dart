import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Screens/Pre-Login/Open.dart';
import 'package:myfoodbox/Screens/Pre-Login/start.dart';
import '../../../Constants.dart' as Constants;

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(20),
          // color: Color(0xfffdfdfd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'GET SERVED FIRST',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.06,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/GetStarted/GetStartedImg.png',
                    height: size.height * 0.4,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Find what’s hot, find what’s just opened and then look for the worst review of the week. There is so much to learn from watching a restaurant getting absolutely panned and having a bad experience. Go and see it for yourself.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "- Gordon Ramsey, Chef",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontSize: size.width * 0.04,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    text: 'GET STARTED',
                    press: () {
                      Get.offAll(() => const StartPage());
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => StartPage()));
                    },
                    color: Constants.dBlue,
                    textColor: Colors.white,
                    length: size * 0.7,
                    fontsize: size.width * 0.05,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: size.width * 0.9,
                    child: Text(
                      'By proceeding you calim to agree to out Privacy Poilcy in accordance to our Terms and Services',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: size.width * 0.027,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
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
