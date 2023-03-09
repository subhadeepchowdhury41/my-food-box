import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:myfoodbox/Screens/Pre-Login/address.dart';
import 'package:myfoodbox/Services/LocalDBServices.dart';
import 'package:myfoodbox/Services/RestClient.dart';
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
  final homeController = HomeController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _fnameCtrl = TextEditingController();
  final TextEditingController _lnameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();

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
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      formField(
                        controller: _fnameCtrl,
                        size: size,
                        text: 'First Name',
                        validator:(value) =>
                        value == null || value.length == 0 ?
                         "First name can't be Empty": null,
                      ),
                      formField(
                        controller: _lnameCtrl,
                        size: size,
                        text: 'Last Name',
                      ),
                      formField(
                        controller: _emailCtrl,
                        size: size,
                        validator: (value) =>
                        value == null || value.length == 0 ?
                         "Email can't be Empty": null,
                        text: 'Email',
                      ),
                      formField(
                        controller: _phoneCtrl,
                        size: size,
                        text: 'Phone Number',
                        validator: (value) =>
                          value == null || value.length != 10 ? 
                          "Invalid phone number" : null,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.07, 0, size.width * 0.07, 0),
                        child: TextFormField(
                          controller: _passwordCtrl,
                          validator: (value) =>
                          value == null || value.length == 0 ?
                         "Password can't be Empty": null,
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
                          controller: _confirmPasswordCtrl,
                          validator: (value) {
                            if (value == null || value == '') {
                              return "Repeat the password";
                            } else if (value != _passwordCtrl.text) {
                              return "Passwords don't match";
                            }
                            return null;
                          },
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
                      press: () async {
                        if (_form.currentState!.validate()) {
                          await HttpServices.sendPostReq('signup', body: {
                            'email': _emailCtrl.text,
                            'phone': _phoneCtrl.text,
                            'fname': _fnameCtrl.text,
                            'lname': _lnameCtrl.text,
                            'password': _passwordCtrl.text
                          }).then((resposne) async {
                            if (resposne != null) {
                              if (resposne.containsKey('id')) {
                                print(resposne.toString());
                                await LocalDBServices.saveUserId(resposne['id']).then((value){
                                  homeController.bottomNavIndex.value = 0;
                                  homeController.id = resposne['id'];
                                });
                                // Get.to(()=> const Landing());
                                Get.to(() => const Adress());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(resposne['result']))
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Something went wrong!'))
                              );
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please fill the form properly'))
                          );
                        }
                        
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
