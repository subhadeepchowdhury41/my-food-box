import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfoodbox/Services/LocalDBServices.dart';
import 'package:myfoodbox/Services/RESTClient.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class QrResult extends StatefulWidget {
  final String code;
  final Function() closeScreen;

  const QrResult({Key? key, required this.code, required this.closeScreen})
      : super(key: key);

  @override
  State<QrResult> createState() => _QrResultState();
}

class _QrResultState extends State<QrResult> {
  Map<String, dynamic> details = {};
  Future<void> markAttendence() async {
    var dateTime = DateTime.now();
    final String? uid = await LocalDBServices.getUserId();
    print(uid);
    await HttpServices.sendPostReq('appearence', body: {
      'employee': uid,
      'restaurant': widget.code,
      'date': '${dateTime.year}-${dateTime.month}-${dateTime.day+1}',
      'time': '${dateTime.hour}:${dateTime.minute}'
    }).then((response) {
      if (response == null) {
        return;
      }
      if (response.containsKey('id')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully marked your appearence'))
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['result']))
        );
      }
    });
  }
  Future<void> getRestaurantDetails() async {
    await HttpServices.sendGetReq('restaurant/${widget.code}').then((response) async {
      if (response == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong!'))
        );
        return;
      }
      if (response.containsKey('restaurant')) {
        setState(() {
          details['name'] = response['restaurant']['name'];
          details['address'] = response['restaurant']['address'];
        });
        print('.......$details');
        await markAttendence();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['result']))
        );
      }
    });
  }
  _init() async {
    await getRestaurantDetails();
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    width: size.width,
                    child: Center(
                      child: Text(
                        "Scan Result",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  QrImage(
                    data: widget.code,
                    size: size.width * 0.4,
                    version: QrVersions.auto,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Scanned Result",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.green.withOpacity(0.5),
                    child: Center(
                      child: details['name'] == null ? 
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        )
                      ): Text(
                        details['name'],
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        details['address'] ?? '',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
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
    );
  }
}
