import 'package:myfoodbox/Model/FoodMenu.dart';
import 'package:myfoodbox/Model/singleFood.dart';

class CartProduct {
  final SingleFood singleFood;
  final int qty;

  CartProduct({required this.singleFood, required this.qty});

  Map toJson() {
    Map singleFood = (this.singleFood != null ? this.singleFood.toJson() : null) as Map;

    return {'singleFood': singleFood, "qty": qty};
  }
}