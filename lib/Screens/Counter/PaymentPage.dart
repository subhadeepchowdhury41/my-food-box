import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Constants.dart';
import 'package:myfoodbox/Controller/cartController.dart';
import 'package:get/get.dart';
import 'package:myfoodbox/Screens/Home/BottomNavBar/Home.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: AppBar().preferredSize.height,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: iconBlack,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        "Checkout Order",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: textBlack,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Canteen",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: textBlack,
                                fontSize: 16,
                              ),
                            ),
                            Divider(
                              color: textBlack,
                              thickness: 1,
                            ),
                            Text(
                              "Food Counter C",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  color: textBlack,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Methods",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: textBlack,
                                fontSize: 16,
                              ),
                            ),
                            Divider(
                              color: textBlack,
                              thickness: 1,
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                cartController.onlineOrWallet.value = 0;
                              },
                              child: Row(
                                children: [
                                  Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 2),
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child:
                                          cartController.onlineOrWallet.value ==
                                                  0
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                )
                                              : Container()),
                                  const SizedBox(width: 20),
                                  Text(
                                    "Wallet",
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: textBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                cartController.onlineOrWallet.value = 1;
                              },
                              child: Row(
                                children: [
                                  Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 2),
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child:
                                          cartController.onlineOrWallet.value ==
                                                  1
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                )
                                              : Container()),
                                  const SizedBox(width: 20),
                                  Text(
                                    "Online",
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: textBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet",
                              style: GoogleFonts.openSans(
                                // fontWeight: FontWeight.bold,
                                color: textBlack,
                                fontSize: 16,
                              ),
                            ),
                            Divider(
                              color: textBlack,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Wallet Balance",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color: textBlack,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "2000",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color:textBlack,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Items List",
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: textBlack,
                            fontSize: 16,
                          ),
                        ),
                        Divider(
                          color: textBlack,
                          thickness: 1,
                          endIndent: 120,
                          indent: 120,
                        ),
                        Container(
                          height: cartController.cartProduct.length * 70,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cartController.cartProduct.length,
                            itemBuilder: (BuildContext context, index) {
                              return itemCard(index);
                            },
                          ),
                        ),
                        Divider(
                          color: textBlack,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.openSans(
                                color: textRed,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee_sharp,
                                  color: textRed,
                                  size: 18,
                                ),
                                Text(
                                  cartController.getCartTotal().toString(),
                                  style: GoogleFonts.openSans(
                                    color: textRed,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Note For Restaurant",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: textBlack,
                                fontSize: 16,
                              ),
                            ),
                            Divider(
                              color:textBlack,
                              thickness: 1,
                            ),
                            TextFormField(
                              controller: cartController.noteController,
                              decoration: InputDecoration(
                                hintText: "Any Note for Restaurant?",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBlack,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return checkoutConfirmDialog();
                });
          },
          child: Container(
            color: Colors.red,
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                "Checkout",
                style: GoogleFonts.openSans(
                  color: textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget orderConfirmDialog() {
    Random random = new Random();
    int randomNumber = random.nextInt(1000) + 101;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Order Alert !",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  children: [
                    Text(
                      "Order ID: $randomNumber is Placed Successfully.",
                      style: GoogleFonts.openSans(
                        color: textBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Items",
                      style: GoogleFonts.openSans(
                        color: textBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: cartController.cartProduct.length < 2 ? 80 :150,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cartController.cartProduct.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartController
                                          .cartProduct[index].singleFood.name ??
                                      "",
                                  style: GoogleFonts.openSans(
                                    color: textBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${cartController.cartProduct[index].qty.toString()} X ${cartController.cartProduct[index].singleFood.price}",
                                  style: GoogleFonts.openSans(
                                    color: textBlack,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Total: ${cartController.getCartTotal()}",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: textBlack,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: QrImage(
                        data: "Rs. 400",
                        size: 100,
                        version: QrVersions.auto,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "Okay",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: textWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            left: MediaQuery.of(context).size.width * 0.2 + 40,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.checklist,
                color: iconWhite,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkoutConfirmDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Alert !",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    if (cartController.useWallet.value == false) {
                      cartController.useWallet.value = true;
                    } else {
                      cartController.useWallet.value = false;
                    }
                  },
                  child: Obx(() {
                    return Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.square_outlined,
                                color: Colors.red,
                                size: 25,
                              ),
                              cartController.useWallet.value
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.red,
                                      size: 16,
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Use Wallet Balance : 1128",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: textWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.offAll(Home());
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return orderConfirmDialog();
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "Okay",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: textWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -40,
            left: MediaQuery.of(context).size.width * 0.2 + 40,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.checklist,
                color: iconWhite,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemCard(int index) {
    double singleTotal =
        cartController.cartProduct[index].singleFood.price!.toDouble() *
            cartController.cartProduct[index].qty.toDouble();
    return Column(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        child: Text(
                          cartController.cartProduct[index].singleFood.name ??
                              "",
                          style: GoogleFonts.openSans(
                            color: textBlack,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee_sharp,
                        size: 16,
                        color: iconBlack,
                      ),
                      Text(
                        "${cartController.cartProduct[index].singleFood.price}",
                        style: GoogleFonts.openSans(
                          fontSize: 17,
                          color: textBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " X ${cartController.cartProduct[index].qty}",
                        style: GoogleFonts.openSans(
                          fontSize: 17,
                          color: textBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee_sharp,
                        color: iconBlack,
                        size: 16,
                      ),
                      Container(
                        child: Text(
                          "$singleTotal",
                          style: GoogleFonts.openSans(
                            fontSize: 17,
                            color: textBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
