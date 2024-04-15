import 'package:flutter/material.dart';

class RatingDisplay extends StatelessWidget {
  final double rating;

  const RatingDisplay({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.star, color: Colors.yellow),
        Text('Calificación: $rating'),
      ],
    );
  }
}
