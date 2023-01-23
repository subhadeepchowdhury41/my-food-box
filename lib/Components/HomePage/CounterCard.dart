import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart' as Constants;

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.size,
    required this.image,
    required this.counterName,
    required this.dishName,
    required this.desc,
    required this.rating,
    required this.price,
  });

  final Size size;
  final String image;
  final String counterName;
  final String dishName;
  final String desc;
  final String rating;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      counterName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      dishName,
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundColor: Constants.dBlue,
                            radius: size.width * 0.04,
                            child: const Icon(
                              Icons.trending_up_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          desc,
                          style: const TextStyle(color: Constants.Grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color(0xff5FC745),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              rating,
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Color(0xffFDFF88),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                      child: Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          fontSize: size.width * 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
