import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/Profile%20Page/ProfilePicture.dart';
import 'package:myfoodbox/Components/Profile%20Page/listTileIcon.dart';
import 'package:myfoodbox/Components/RoundedButton.dart';
import 'package:myfoodbox/Components/backButton.dart';
import 'package:myfoodbox/Components/formField.dart';
import '../../Components/AppBar.dart';
import '../../Components/Profile Page/ListTileSub.dart';
import '../../Constants.dart' as Constants;

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
              top: size.height * 0.07,
              left: size.width * 0.04,
              child: appBar(size: size, text: 'Edit Your Profile',),
            ), //Back Button and Title

            Positioned(
              top: size.height * 0.2,
              child: Pfp(radius: size.width * 0.15),
            ), //PFP and Name
            Positioned(
              top: size.height * 0.29,
              left: size.width*0.5,
              child: RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Constants.dBlue,
                padding: EdgeInsets.all(size.width*0.02),
                shape: const CircleBorder(),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: size.width*0.06,
                ),
              )
            ),
            Positioned(
              top: size.height * 0.4,
              width: size.width,
              child: Column(
                children: <Widget>[
                  formField(size: size, text: 'Name'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  formField(size: size, text: 'Phone Number'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  formField(size: size, text: 'Email'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  formField(size: size, text: 'Gender'),
                ],
              ),
            ),
            Positioned(
                bottom: size.height * 0.1,
                child: RoundedButton(
                  text: 'Update Profile',
                  press: () {},
                  color: Constants.dBlue,
                  textColor: Colors.white,
                  length: size * 0.8,
                  fontsize: 25,
                )),
            //Back Button
          ],
        ),
      ),
    );
  }
}


