// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, deprecated_member_use, unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/products.dart';
import '../style.dart';
import '../widgets/rating_item.dart';
import 'error.dart';

class Detail extends StatefulWidget {
  final Products products;
  Detail(this.products);
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> ShowConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: Text(
              'Konfirmasi',
            ),
            content: SingleChildScrollView(
              child: ListBody(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Apakah kamu yakin ingin membeli barang ini ?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('08571245125');
                },
                child: Text('Beli'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.products.thumbnail,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.products.title,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.products.brand,
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.products.price}',
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
                            Column(
                              children: [
                                Row(
                                  children: [1, 2, 3, 4, 5].map((index) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 2),
                                      child: RatingItem(
                                        index: index,
                                        rating: widget.products.rating.toInt(),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  '(${widget.products.rating}/5)',
                                  style: regularTextStyle.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Deskripsi',
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
                        child: Column(
                          children: [
                            Text(
                              widget.products.description,
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: edge),
                                child: Text(
                                  'Stock',
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
                                child: Column(
                                  children: [
                                    Text(
                                      widget.products.stock.toString(),
                                      style: greyTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: edge),
                                child: Text(
                                  'Discount',
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
                                child: Column(
                                  children: [
                                    Text(
                                      '\$${widget.products.discount}'
                                          .toString(),
                                      style: greyTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.products.imageUrl.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: edge),
                  height: 50,
                  width: MediaQuery.of(context).size.width - (2 * edge),
                  child: RaisedButton(
                    onPressed: () {
                      ShowConfirmation();
                    },
                    color: colorPrimary,
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Beli Sekarang',
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/images/btn_wishlist_filed.png'
                          : 'assets/images/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
