import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Controller/home_controller.dart';
import 'package:myfoodbox/Screens/Home/landing.dart';
import 'package:myfoodbox/Services/LocalDBServices.dart';
import 'package:myfoodbox/Services/RestClient.dart';

import '../../Components/RoundedButton.dart';
import '../../Components/formField.dart';
import '../../Constants.dart' as Constants;
import '../Home/locationSelection.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool show = false;
  HomeController homeController = Get.find();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _form,
            child: Column(
              // alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset(
                  'assets/images/LogIn/LogIn.png',
                  width: size.width,
                ),
                formField(
                  controller: _emailCtrl,
                  size: size,
                  text: 'Email Id',
                  validator: (value) =>
                  value == null || value.length == 0
                    ? "Password can't be empty" : null,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.07, 0, size.width * 0.07, 0),
                  child: TextFormField(
                    controller: _passwordCtrl,
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
                    validator: (value) => 
                    value == null || value.length == 0
                     ? "Password can't be empty" : null,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  // height: size.height * 0.08,
                  child: RoundedButton(
                    text: 'LOGIN',
                    press: () async {
                      if (_form.currentState!.validate()) {
                        await HttpServices.sendPostReq('signin', body: {
                          'email': _emailCtrl.text,
                          'password': _passwordCtrl.text
                        }).then((resposne) async {
                          if (resposne != null) {
                            if (resposne.containsKey('id')) {
                              print(resposne.toString());
                              await LocalDBServices.saveUserId(resposne['id']).then((value){
                                print(value);
                                homeController.bottomNavIndex.value = 0;
                                homeController.id = resposne['id'];
                              });
                              // Get.to(()=> const Landing());
                              Get.to(()=> const LocationSelectionScreen());
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
                    color: Constants.dBlue,
                    textColor: Colors.white,
                    length: size * 0.7,
                    fontsize: size.width * 0.05,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
