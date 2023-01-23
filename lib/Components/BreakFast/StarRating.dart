import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.size, required this.rating,
  });

  final Size size;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating, (index) {
        return Icon(
          Icons.star,
          color: Colors.yellow,
          size: size.width*0.04,
        );
      }),
    );
  }
}