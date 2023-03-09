import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/DualButton.dart';
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

  Future<void> _getOTP() async {
    try {
      String? userId = await LocalDBServices.getUserId();
      if (userId != null) {
        await HttpServices.sendPostReq(
          'sendotp',
          body: {'userId': userId},
        ).then((value) {
          if (value != null && value.containsKey('id')) {
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
          }
          startTimer();
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    _getOTP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
          Container(
            width: size.width * 0.5,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
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
          const SizedBox(height: 10),
          if (_start < 60)
            Center(
              child: Text('Resend OTP in $_start'),
            ),
          Positioned(
            bottom: 0,
            child: DualButton(
              size: size,
              press_1: () async {
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
    );
  }
}
