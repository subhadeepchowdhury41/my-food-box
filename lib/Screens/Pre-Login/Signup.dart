import 'package:flutter/material.dart';
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
      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: size.height * 0.1,
              child: Logo(
                radius: 60,
              ),
            ),
            Positioned(
              top: size.height * 0.26,
              child: Container(
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
            ),
            Positioned(
              top: size.height * 0.34,
              width: size.width,
              child: formField(
                size: size,
                text: 'Name',
              ),
            ),
            Positioned(
              top: size.height * 0.41,
              width: size.width,
              child: formField(
                size: size,
                text: 'Email',
              ),
            ),
            Positioned(
              top: size.height * 0.48,
              width: size.width,
              child: formField(
                size: size,
                text: 'Phone Number',
              ),
            ),
            Positioned(
              top: size.height * 0.56,
              width: size.width,
              child: Padding(
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
                      )),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.64,
              width: size.width,
              child: Padding(
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
                      )),
                ),
              ),
            ),
            Positioned(
                top: size.height * 0.7,
                left: size.width * 0.05,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Use a Strong Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: size.width * 0.032,
                      color: Constants.Grey,
                    ),
                  ),
                )),
            Positioned(
                top: size.height * 0.85,
                child: RoundedButton(
                  color: Constants.dBlue,
                  text: 'SignUp',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Adress()));
                  },
                  fontsize: size.width * 0.06,
                  length: size * 0.7,
                  textColor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
