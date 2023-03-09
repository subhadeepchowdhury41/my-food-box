import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Model/CartProduct.dart';
import '../Model/singleFood.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  List<CartProduct> cartProduct = List<CartProduct>.empty().obs;
  var onlineOrWallet = 0.obs;
  var useWallet = true.obs;
  TextEditingController noteController = TextEditingController();

  var numOfItemsInDescription = 1.obs;

  getCounterOrButton(int id) {
    final index =
        cartProduct.indexWhere((element) => element.singleFood.id == id);

    if (index > -1) {
      return false;
    } else {
      return true;
    }
  }

  getCartTotal() {
    double sum = 0.0;

    cartProduct.forEach((element) {
      sum = sum + (element.qty * element.singleFood.price!.toDouble());
    });

    return sum;
  }

  getCartItemQuantity(int id) {
    final index =
        cartProduct.indexWhere((element) => element.singleFood.id == id);
    return cartProduct[index].qty.toString();
  }

  // Function Increases the Number of items in Cart
  increaseItemsInCart(SingleFood singleFood) {
    final index = cartProduct
        .indexWhere((element) => element.singleFood.id == singleFood.id);

    cartProduct[index] = CartProduct(
      singleFood: singleFood,
      qty: (1 + cartProduct[index].qty),
    );
  }

  // Function Decreases the Number of items in Cart
  decreaseItemsInCart(SingleFood singleFood) {
    final index = cartProduct
        .indexWhere((element) => element.singleFood.id == singleFood.id);

    if (cartProduct[index].qty > 1) {
      cartProduct[index] = CartProduct(
        singleFood: singleFood,
        qty: (cartProduct[index].qty - 1),
      );
    } else {
      cartProduct.removeAt(index);
    }
  }

  addToCart(SingleFood singleFood) {
    final index = cartProduct.indexWhere((element) {
      return element.singleFood.id == singleFood.id;
    });

    if (index > -1) {
      cartProduct[index] = CartProduct(
        singleFood: singleFood,
        qty: (numOfItemsInDescription.value + cartProduct[index].qty),
      );
    } else {
      cartProduct.add(
        CartProduct(singleFood: singleFood, qty: numOfItemsInDescription.value),
      );
    }

    cartProduct.forEach((element) {
      print(element.singleFood.name);
      print(element.qty);
    });
    // Initializes again the Number of items in product description screen to 1
    numOfItemsInDescription.value = 1;
  }
}
