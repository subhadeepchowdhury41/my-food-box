import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/LogOutPrompt.dart';
import 'package:myfoodbox/Components/Profile%20Page/ProfilePicture.dart';
import 'package:myfoodbox/Components/Profile%20Page/listTileIcon.dart';
import 'package:myfoodbox/Components/backButton.dart';
import 'package:myfoodbox/Screens/UserProfile/Activity.dart';
import 'package:myfoodbox/Screens/UserProfile/EditProfile.dart';
import 'package:myfoodbox/Screens/UserProfile/WishList.dart';
import '../../Components/Profile Page/ListTileSub.dart';
import '../../Constants.dart' as Constants;

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
              top: 0,
              child: Container(
                color: Constants.lBlue,
                height: size.height * 0.4,
                width: size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.18,
                    ),
                    Pfp(radius: size.width * 0.12),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'Hello',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ), //PFP and Name
            Positioned(
              top: size.height * 0.07,
              left: size.width * 0.04,
              child: backButton(
                size: size,
              ),
            ), //Back Button
            Positioned(
              top: size.height * 0.07,
              right: size.width * 0.04,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                icon: const Icon(
                  Icons.linked_camera_rounded,
                  size: 24.0,
                  color: Colors.black,
                ),
                label: Text(
                  'EDIT',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                  ),
                ), // <-- Text
              ),
            ), //Edit Button

            Positioned(
              top: size.height * 0.43,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Activity()));},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.monitor_heart,
                      suffixIcon: Icons.arrow_right,
                      title: 'View Activity',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>WishList()));},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.favorite_border,
                      suffixIcon: Icons.arrow_right,
                      title: 'WishList',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.playlist_add_check,
                      suffixIcon: Icons.arrow_right,
                      title: 'Orders',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.wallet,
                      suffixIcon: Icons.arrow_right,
                      title: 'Payments',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.settings,
                      suffixIcon: Icons.arrow_right,
                      title: 'Settings',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.info_outline,
                      suffixIcon: Icons.arrow_right,
                      title: 'About',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.help,
                      suffixIcon: Icons.arrow_right,
                      title: 'Help',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {showLogOutPopup(context);},
                    child: ListTileSub(
                      size: size,
                      prefixIcon: Icons.logout,
                      suffixIcon: Icons.arrow_right,
                      title: 'LogOut',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
