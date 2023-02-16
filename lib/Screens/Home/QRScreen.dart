import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myfoodbox/Screens/Home/QrResult.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.width * 0.8 + 10,
                    width: size.width * 0.8 + 10,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.transparent),
                            height: size.width * 0.8,
                            width: size.width * 0.8,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.red),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.orange),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.blue),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.green),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Container(
                          height: size.width * 0.8,
                          width: size.width * 0.8,
                          child: MobileScanner(
                            fit: BoxFit.cover,
                            onDetect: (barcode) {
                              if (!isScanCompleted) {
                                String code =
                                    barcode.barcodes.first.rawValue ?? "---";
                                isScanCompleted = true;
                                Get.to(
                                  () => QrResult(
                                    code: code,
                                    closeScreen: closeScreen,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 15,
              left: 10,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: (size.height * 0.9 - (size.width * 0.8)) / 3,
              left: size.width * 0.1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    "Scan And Go..",
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
