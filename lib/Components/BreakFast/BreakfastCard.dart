import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/BreakFast/Counter.dart';
import '../../Constants.dart' as Constants;
import 'StarRating.dart';

class BreakfastCard extends StatelessWidget {
  const BreakfastCard({
    super.key,
    required this.size,
    required this.price,
    required this.discount,
    required this.remark,
    required this.ratingcount,
    required this.image,
    required this.dishname,
    required this.desc,
  });

  final Size size;
  final int price;
  final int discount;
  final String remark;
  final int ratingcount;
  final String image;
  final String dishname;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                child: SizedBox(
                    width: size.width * 0.45, child: Image.network(image)),
              ),
              Positioned(
                  bottom: 0,
                  left: size.width * 0.04,
                  child: CounterCard(size: size))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 0),
                  child: Text(
                    dishname,
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 0),
                  child: Text(
                    desc,
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Constants.Grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 0),
                  child: Row(
                    children: [
                      StarRating(
                        size: size,
                        rating: 5,
                      ),
                      Text(
                        '$remark | $ratingcount ratings',
                        style: TextStyle(color: Constants.Grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 0),
                  child: Text(
                    '₹$price',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 0),
                  child: Text(
                    '$discount% off $price',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        fontSize: size.width * 0.044,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
