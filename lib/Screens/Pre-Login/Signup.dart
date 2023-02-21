import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Screens/Pre-Login/address.dart';
import '../../Components/LogoWidget.dart';
import '../../Components/formField.dart';
import '../../Constants.dart' as Constants;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    show = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // alignment: Alignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 30),
                Column(
                  children: [
                    Logo(
                      radius: 60,
                    ),
                    Container(
                      width: size.width * 0.75,
                      child: Text(
                        'WELCOME',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.061,
                          color: Constants.dBlue,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    formField(
                      size: size,
                      text: 'Name',
                    ),
                    formField(
                      size: size,
                      text: 'Email',
                    ),
                    formField(
                      size: size,
                      text: 'Phone Number',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.07, 0, size.width * 0.07, 0),
                      child: TextFormField(
                        obscureText: show,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                show = !show;
                              });
                            },
                            child: Icon(
                              show ? Icons.visibility : Icons.visibility_off,
                              color: Constants.Grey,
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Constants.Grey,
                            fontSize: size.width * 0.04,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.07, 0, size.width * 0.07, 0),
                      child: TextFormField(
                        obscureText: show,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                show = !show;
                              });
                            },
                            child: Icon(
                              show ? Icons.visibility : Icons.visibility_off,
                              color: Constants.Grey,
                            ),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            color: Constants.Grey,
                            fontSize: size.width * 0.04,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Use a Strong Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.width * 0.025,
                          color: Constants.Grey,
                        ),
                      ),
                    ),
                    RoundedButton(
                      color: Constants.dBlue,
                      text: 'Sign Up',
                      press: () {
                        Get.to(() => const Adress());
                      },
                      fontsize: size.width * 0.055,
                      length: size * 0.7,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
