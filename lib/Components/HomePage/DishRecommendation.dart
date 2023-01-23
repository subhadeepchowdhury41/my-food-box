import 'package:flutter/material.dart';

class DishRecommend extends StatelessWidget {
  const DishRecommend({
    super.key,
    required this.size,
    required this.image,
    required this.dishName,
  });

  final Size size;
  final String image;
  final String dishName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            image,
          ),
          radius: size.width * 0.14,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            dishName,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: size.width * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}