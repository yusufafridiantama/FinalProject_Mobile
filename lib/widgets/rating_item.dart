// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  const RatingItem({
    required this.index,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/icon_star.png'
          : 'assets/images/icon_star_grey.png',
      width: 20,
    );
  }
}
