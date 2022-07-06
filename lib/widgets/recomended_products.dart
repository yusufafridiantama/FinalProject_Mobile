// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../models/products.dart';
import '../pages/detail.dart';
import '../style.dart';

class RecommendedProducts extends StatelessWidget {
  final Products products;
  RecommendedProducts(this.products);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detail(products)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 140,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    products.thumbnail,
                    width: 220,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            '${products.rating}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                products.title,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                products.brand,
                style: regularTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                products.category,
                style: greyTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${products.price}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
