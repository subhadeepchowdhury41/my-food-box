import 'package:flutter/material.dart';
import '../../Constants.dart' as Constants;

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Constants.Grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 0.3,
          height: size.height * 0.05,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.1,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    '-',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.08,
                child: const Text(
                  '1',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: size.width * 0.1,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    '+',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}