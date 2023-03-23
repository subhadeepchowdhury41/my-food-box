import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/AppBar.dart';
import 'package:myfoodbox/Components/HomePage/BottomNav.dart';
import '../../Components/BreakFast/BreakfastCard.dart';
import '../../Constants.dart' as Constants;

class Breakfast extends StatefulWidget {
  const Breakfast({Key? key}) : super(key: key);

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              children: [
                appBar(size: size, text: 'Breakfast'),
                SizedBox(
                  width: size.width * 0.2,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  icon: const Icon(
                    Icons.tune,
                    size: 24.0,
                    color: Constants.Grey,
                  ),
                  label: Text(
                    'Filter',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Constants.Grey,
                      fontFamily: 'Inter',
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
              child: BreakfastCard(
                size: size,
                price: 100,
                discount: 40,
                remark: 'Good',
                ratingcount: 60,
                image:
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.FaGyDC7_ysgIg1aMr71jVQHaHa%26pid%3DApi&f=1&ipt=b2c46edf083c781bfe9b8d3cbfdbbdea26d0f191c30fea820e2c13c4d7e38e34&ipo=images',
                dishname: 'Dish Name',
                desc: 'Short Description',
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
              child: BreakfastCard(
                size: size,
                price: 100,
                discount: 40,
                remark: 'Good',
                ratingcount: 60,
                image:
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.FaGyDC7_ysgIg1aMr71jVQHaHa%26pid%3DApi&f=1&ipt=b2c46edf083c781bfe9b8d3cbfdbbdea26d0f191c30fea820e2c13c4d7e38e34&ipo=images',
                dishname: 'Dish Name',
                desc: 'Short Description',
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
              child: BreakfastCard(
                size: size,
                price: 100,
                discount: 40,
                remark: 'Good',
                ratingcount: 60,
                image:
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.FaGyDC7_ysgIg1aMr71jVQHaHa%26pid%3DApi&f=1&ipt=b2c46edf083c781bfe9b8d3cbfdbbdea26d0f191c30fea820e2c13c4d7e38e34&ipo=images',
                dishname: 'Dish Name',
                desc: 'Short Description',
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
              child: BreakfastCard(
                size: size,
                price: 100,
                discount: 40,
                remark: 'Good',
                ratingcount: 60,
                image:
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.FaGyDC7_ysgIg1aMr71jVQHaHa%26pid%3DApi&f=1&ipt=b2c46edf083c781bfe9b8d3cbfdbbdea26d0f191c30fea820e2c13c4d7e38e34&ipo=images',
                dishname: 'Dish Name',
                desc: 'Short Description',
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        size: size,
      ),
    );
  }
}
