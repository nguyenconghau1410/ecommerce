import 'package:elma/constants/constant.dart';
import 'package:elma/screens/orderSuccess.dart';
import 'package:elma/screens/paymentMethod.dart';
import 'package:elma/screens/shippingAddress.dart';
import 'package:flutter/material.dart';

import '../services/cart_controller.dart';

class OrderConfirm extends StatefulWidget {
  Map<String, dynamic> info;
  List<CartController> carts;
  OrderConfirm({super.key, required this.info, required this.carts});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {

  int caculate() {
    int sum = 0;
    widget.carts.forEach((element) {
      sum += element.cart!.product!.price!.first * element.cart!.quantity!;
    });
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Confirm order'),
          leading: BackButton(),
          backgroundColor: kTransparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Shipping address",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.info['name'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.info['address'],
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "${widget.info['city']} - ${widget.info['country']}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment method",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             PaymentMethod()));
                                  },
                                  child: Text(
                                    "Change",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: kPrimaryColor,
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: Image.asset("images/mastercard.png"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "**** **** **** 1422",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Products",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 400,
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(widget.carts.length, (index) {
                                  return cartItem(widget.carts[index]);
                                }),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total payment",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    numberFormatted(caculate()),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderSuccess()));
                                  },
                                  child: Text(
                                    "Confirm order",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size.fromHeight(55),
                                      backgroundColor: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))))
                            ],
                          )
                        ])))));
  }

  Widget cartItem(CartController cartController) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cartController.cart!.product!.image!,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                  cartController.cart!.product!.name!,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text(numberFormatted(cartController.cart!.product!.price!.first),
                      style: TextStyle(
                          color: Color(0xFF5C6AC4),
                          fontWeight: FontWeight.w900,
                          fontSize: 16)),
                  const SizedBox(width: 40,),
                  Text("SL: ${cartController.cart!.quantity}",style: TextStyle(
                      color: Color(0xFF5C6AC4),
                      fontWeight: FontWeight.w900,
                      fontSize: 16))
                ],
              )
            ],
          ),
        ]));
  }
}
