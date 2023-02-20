import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/AddToCart.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/Home.dart';
import 'package:flutter/material.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/HomeBottomNav.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/history.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/profile.dart';

import '../Model/FoodMenu.dart';
import '../Screens/Home/BottomNavBar/profileScreen.dart';

class HomeController extends GetxController {
  // var homeIndex = 0.obs;
  //
  // List<Widget> pagesList = [
  //   Home(),
  //   Home(),
  //   AddToCart(),
  //   Profile(),
  // ];

  var bottomNavIndex = 0.obs;
  var isSearching = false.obs;

  List<GButton> iconsList = [
    const GButton(
      icon: Icons.home,
      text: "Home",
    ),
    const GButton(
      icon: Icons.history,
      text: "History",
    ),
    // const GButton(
    //   icon: Icons.shopping_cart,
    //   text: "Cart",
    // ),
    const GButton(
      icon: Icons.person,
      text: "Profile",
    ),
  ];

  changePage(index) {
    bottomNavIndex.value = index;
  }

  List<Widget> bottomNavigationPages = [
    HomeBottomNav(),
    HistoryScreen(),
    // AddToCart(),
    ProfileScreen(close: false),
  ];

  var menuList = [].obs;

  Future<void> readJson() async{
    final String response = await rootBundle.loadString('assets/Data/foodMenu.json');
    final data = await json.decode(response);

    menuList.value = data;
  }

}
