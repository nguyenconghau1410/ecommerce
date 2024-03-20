import 'package:elma/constants/ability.dart';
import 'package:elma/constants/constant.dart';
import 'package:elma/models/products.dart';
import 'package:elma/screens/cartScreen.dart';
import 'package:elma/widgets/container_button_model.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../api/api_cart.dart';

class ProductScreen extends StatefulWidget {
  Product product;
  ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  Future<void> add(String userid, String id) async {
    await APICart.addCart(userid, id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Detail",
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          leading: BackButton(),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 650,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: FanCarouselImageSlider(
                                indicatorActiveColor: kPrimaryColor,
                                imagesLink: widget.product.images!,
                                isAssets: false,
                                sliderWidth: 450,
                                sliderHeight: 350,
                                autoPlay: true,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child:
                              Text(
                                widget.product.name!,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 22),
                                overflow:
                                TextOverflow.ellipsis, // Xử lý overflow
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(numberFormatted(widget.product.price!.first),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: kPrimaryColor,
                                    )),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 25,
                                  itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.product.description!,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54),
                              overflow: TextOverflow.ellipsis, // Xử lý overflow
                              maxLines: 10,
                            ),
                            SizedBox(
                              height: 30,
                            ),

                          ],
                        ),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(top: 10),
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            add(Ability.user!.id!, widget.product!.id!);
                          },
                          child: Container(
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(31, 205, 187, 187),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Icon(
                                size: 30,
                                Icons.shopping_cart,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {

                          },
                          child: ContainerButtonModel(
                            frColor: kWhiteColor,
                            itext: "Buy now",
                            containerWidth:
                            MediaQuery.of(context).size.width / 1.8,
                            bgColor: Color(0xFF5C6AC4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )
    );
}}

