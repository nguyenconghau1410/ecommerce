import 'package:elma/constants/constant.dart';
import 'package:elma/models/products.dart';
import 'package:elma/screens/cartScreen.dart';
import 'package:elma/widgets/container_button_model.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  Product product;
  ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
          child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: FanCarouselImageSlider(
                        indicatorActiveColor: kPrimaryColor,
                        imagesLink: widget.product.images!,
                        isAssets: false,
                        sliderWidth: 430,
                        sliderHeight: 350,
                        autoPlay: true,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.name!,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 28),
                                    overflow:
                                    TextOverflow.ellipsis, // Xử lý overflow
                                    maxLines: 2,
                                  ),
                                ]),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${widget.product.price!.first}",
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                              overflow: TextOverflow.ellipsis, // Xử lý overflow
                              maxLines: 10,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 60,
                                  width: 90,
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
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (Context) => CartScreen()));
                                  },
                                  child: ContainerButtonModel(
                                    frColor: kWhiteColor,
                                    itext: "Buy now",
                                    containerWidth:
                                    MediaQuery.of(context).size.width / 1.7,
                                    bgColor: Color(0xFF5C6AC4),
                                  ),
                                ),
                              ],
                            ),
                            // ProductDetailPopup(),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}

