import 'package:flutter/material.dart';
import '../../Constants.dart' as Constants;

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: size.width*0.08,
      showSelectedLabels: false,
      selectedFontSize: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Constants.Grey,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, color: Constants.Grey,),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet, color: Constants.Grey,),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Constants.Grey,),
          label: 'Cart',
        ),
      ],
    );
  }
}