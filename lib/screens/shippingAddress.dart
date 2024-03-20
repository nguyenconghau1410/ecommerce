
import 'package:elma/constants/ability.dart';
import 'package:elma/constants/constant.dart';
import 'package:elma/screens/orderConfirm.dart';
import 'package:elma/screens/paymentMethod.dart';
import 'package:elma/services/cart_controller.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';

class ShippingAddress extends StatefulWidget {
  List<CartController> carts;
  ShippingAddress({super.key, required this.carts});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  Map<String, dynamic> info() {
    Map<String, dynamic> information = {
      "name": nameController.text.trim(),
      "phone": phoneController.text.trim(),
      "address": addressController.text.trim(),
      "city": cityController.text.trim(),
      "country": countryController.text.trim(),
    };
    return information;
  }

  @override
  void initState() {
    super.initState();
    nameController.text = Ability.user!.name!;
    phoneController.text = "0" + Ability.user!.phone!.toString();
    countryController.text = Ability.user!.country!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shipping address'),
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
                        child: Column(children: [
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Full name",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone number",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Address",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "City",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: countryController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Country",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderConfirm(info: info(), carts: widget.carts,)));
                          },
                          child: Text(
                            "Add address",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(55),
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))))
                    ]))))));
  }
}
