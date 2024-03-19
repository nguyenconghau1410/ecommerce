import 'package:elma/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartController {
  Cart? cart;
  bool clicked = false;

  void init(Cart cart) {
    this.cart = cart;
  }

  void onClick() {
    clicked = !clicked;
  }
}