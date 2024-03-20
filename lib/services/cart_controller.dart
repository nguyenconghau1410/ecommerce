import 'package:elma/api/api_cart.dart';
import 'package:elma/constants/ability.dart';
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

  Future<void> delete(String userid, String id) async {
    await APICart.deleteCart(userid, id);
  }

  Future<void> add(String userid, String id) async {
    await APICart.addCart(userid, id);
  }
}