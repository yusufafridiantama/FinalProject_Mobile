// ignore_for_file: unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_element, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:uas_mobpro/pages/fragrances.dart';
import 'package:uas_mobpro/pages/grocery.dart';
import 'package:uas_mobpro/pages/homepage.dart';
import 'package:uas_mobpro/pages/laptops.dart';
import 'package:uas_mobpro/pages/skincare.dart';
import '../../style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/products.dart';
import '../models/popular_product.dart';
import '../style.dart';
import '../widgets/bottom_navbar_item.dart';
import '../widgets/product_card.dart';
import '../widgets/recomended_products.dart';

class HomePage extends StatelessWidget {
  final String apiUrl = "https://dummyjson.com/products?skip=5&limit=10";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http
        .get(Uri.parse('https://dummyjson.com/products/category/smartphones'));
    return json.decode(result.body)['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const SizedBox(
              height: edge,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset(
                  'assets/images/logo_aalona.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kategori',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 75,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    },
                    child: Image.asset(
                      'assets/images/smartphone.png',
                      width: 105,
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Laptops();
                      }));
                    },
                    child: Image.asset(
                      'assets/images/laptop.png',
                      width: 105,
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Fragrances();
                      }));
                    },
                    child: Image.asset(
                      'assets/images/perfume.png',
                      width: 105,
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Skincare();
                      }));
                    },
                    child: Image.asset(
                      'assets/images/skincare.png',
                      width: 105,
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Grocery();
                      }));
                    },
                    child: Image.asset(
                      'assets/images/grocery.png',
                      width: 105,
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: Recomended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Laptops',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder<List<dynamic>>(
                future: _fecthDataUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> data = snapshot.data;
                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 10),
                          child: RecommendedProducts(Products.fromJson(item)),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: greyColor,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
