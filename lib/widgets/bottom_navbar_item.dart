import 'package:flutter/material.dart';

import '../style.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  BottomNavbarItem({required this.imageUrl, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        // ignore: prefer_const_constructors
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  // ignore: prefer_const_constructors
                  borderRadius: BorderRadius.vertical(
                    // ignore: prefer_const_constructors
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
