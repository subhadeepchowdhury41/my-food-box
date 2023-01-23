import 'package:flutter/material.dart';
import 'package:myfoodbox/Screens/UserProfile/profile.dart';
import '../../Components/RoundedButton.dart';
import '../../Components/formField.dart';
import '../../Constants.dart' as Constants;
import '../Home/Home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/LogIn/LogIn.png',
                width: size.width,
              ),
            ),
            Positioned(
              width: size.width,
              top: size.height * 0.5,
              child: formField(
                size: size,
                text: 'Email Id',
              ),
            ),
            Positioned(
              top: size.height * 0.6,
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
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height*0.8,
                child: SizedBox(
                  height: size.height*0.08,
                  child: RoundedButton(
              text: 'Login',
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(uid: 1,)));},
              color: Constants.dBlue,
              textColor: Colors.white, length: size*0.85, fontsize: 30,
            ),
                ))
          ],
        ),
      ),
    );
  }
}
