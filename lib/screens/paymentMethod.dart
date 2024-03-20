import 'package:elma/constants/constant.dart';
import 'package:elma/screens/orderConfirm.dart';
import 'package:elma/screens/shippingAddress.dart';
import 'package:elma/services/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/cart.dart';

class PaymentMethod extends StatefulWidget {
  Map<String, dynamic> info;
  List<CartController> carts;
  PaymentMethod({super.key, required this.info, required this.carts});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _type = 1;
  void _handeRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product overview'),
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
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 55,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 1
                        ? Border.all(width: 1, color: kPrimaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: kTransparent,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _type,
                              onChanged: _handeRadio,
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              "Amazon Pay",
                              style: _type == 1
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "images/amazon-pay.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 55,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 2
                        ? Border.all(width: 1, color: kPrimaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: kTransparent,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _type,
                              onChanged: _handeRadio,
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              "Credit Card",
                              style: _type == 2
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/visa.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                              Image.asset(
                                "images/mastercard.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 55,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 3
                        ? Border.all(width: 1, color: kPrimaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: kTransparent,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: _type,
                              onChanged: _handeRadio,
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              "Paypal",
                              style: _type == 3
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "images/paypal.png",
                            width: 70,
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 55,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 4
                        ? Border.all(width: 1, color: kPrimaryColor)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: kTransparent,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 4,
                              groupValue: _type,
                              onChanged: _handeRadio,
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              "Google Pay",
                              style: _type == 4
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "images/icon2.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => OrderConfirm()));
                    },
                    child: Text(
                      "Confirm payment",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(55),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
