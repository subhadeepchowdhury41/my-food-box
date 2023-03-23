import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myfoodbox/Components/DualButton.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/Home.dart';
import 'package:myfoodbox/Screens/Pre-Login/start.dart';
import 'package:myfoodbox/Services/RESTClient.dart';
import '../../Constants.dart' as Constants;
import '../../Services/LocalDBServices.dart';

class mailVerify extends StatefulWidget {
  const mailVerify({Key? key}) : super(key: key);

  @override
  State<mailVerify> createState() => _mailVerifyState();
}

class _mailVerifyState extends State<mailVerify> {
  TextEditingController _otpCtrl = TextEditingController();
  String? _token;

  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> _verifyOTP() async {
    try {
      String? userId = await LocalDBServices.getUserId();

      if (_token != null && userId != null) {
        await HttpServices.sendPostReq(
          'verifyotp',
          body: {
            'token': _token,
            'userId': userId,
            'otp': _otpCtrl.text,
          },
        ).then(
          (response) async {
            debugPrint(response.toString());
            if (response != null &&
                response.isNotEmpty &&
                response.containsKey('id')) {
                  await LocalDBServices.markVerified(true).then((val) {
                    Get.to(() => Home());
                  });
            }
          },
        );
      }
    } catch (e) {}
  }

  Future<void> _getOTP() async {
    try {
      String? userId = await LocalDBServices.getUserId();
      if (userId != null) {
        await HttpServices.sendPostReq(
          'sendotp',
          body: {'userId': userId},
        ).then((value) async {
          debugPrint('value: $value');
          if (value != null && value.containsKey('token')) {
            _token = value['token'];
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Center(
                  child: Text(
                    'OTP sent to your registered email address',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          } else {
            if (value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.withOpacity(0.75),
                content: Center(
                  child: Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
            return;
            }
            if (value.containsKey('result')) {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.withOpacity(0.75),
                content: Center(
                  child: Text(
                    value['result'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
            }
          }
          startTimer();
        });
      }
    } catch (e) {
      debugPrint('Error: $e\n\n');
    }
  }

  @override
  void initState() {
    _getOTP();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
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
              top: size.height * 0.25,
              child: Image.asset(
                'assets/images/mailVerify/mailVerify.png',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              top: size.height * 0.45,
              child: Text(
                'Please verify your email address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.05,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.52,
              child: Container(
                width: size.width * 0.7,
                child: Text(
                  'Enter the OTP sent to your email account',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: size.width * 0.035,
                    decoration: TextDecoration.none,
                    color: Constants.Grey,
                    fontFamily: 'Inter',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.55,
              child: Container(
                width: size.width * 0.5,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: _otpCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // color: accent2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Positioned(
              top: size.height * 0.65,
              child: Container(
                width: size.width * 0.5,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33.0),
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2, size.height /13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27)
                      ),
                      backgroundColor: Color.fromARGB(255, 23, 109, 200)
                    ),
                    onPressed: () async {
                      await _verifyOTP();
                    },
                    child: Text('Verify', style: TextStyle(fontSize: 17),),
                  ),
                )
              ),
            ),
            const SizedBox(height: 10),
            if (_start < 60)
              Positioned(
                // top: size.height * 0.82,
                child: Center(
                  child: Text('Resend OTP in $_start'),
                ),
              ),
            Positioned(
              bottom: 0,
              child: DualButton(
                size: size,
                press_1: () async {
                  if (_timer.isActive) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(
                        'Already sent an OTP wait for ${60 - _timer.tick}'
                      ))
                    );
                    return;
                  }
                  // Resend so first timer 60 again
                  setState(() {
                    _start = 60;
                  });
                  // get otp again
                  await _getOTP().then((value) {});
                },
                press_2: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}