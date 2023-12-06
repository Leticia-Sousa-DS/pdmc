import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final int rate;
  const Ratings({
    required this.rate,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (rate>= 1) ? Colors.red : Colors.red[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (rate >= 2) ? Colors.red : Colors.red[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (rate >= 3) ? Colors.red : Colors.red[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (rate >= 4) ? Colors.red : Colors.red[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (rate >= 5) ? Colors.red : Colors.red[100],
        ),
      ],
    );
  }
}