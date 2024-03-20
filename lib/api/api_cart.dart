import 'dart:convert';

import 'package:elma/api/utils.dart';
import 'package:elma/constants/ability.dart';
import 'package:elma/models/cart.dart';
import 'package:elma/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class APICart {
  static Future<List<Cart>> getCart(String userid) async {
    try {
      final response = await http.get(
        Uri.parse("${Utils.apiGetCart}/$userid")
      );
      if(response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        List<Cart> carts = [];
        for(int i = 0; i < data['products'].length; i++) {
          carts.add(Cart.fromJson(data['products'][i]));
        }
        return carts;
      }
      else {
        return [];
      }
    }
    catch(e) {
      rethrow;
    }
  }
  static Future<void> deleteCart(String userid, String id) async {
    try {
      final response = await http.delete(
        Uri.parse("${Utils.apiDeleteCart}/$userid/$id")
      );
      if(response.statusCode == 200) {

      }
      else {
        print(response.statusCode);
      }
    }
    catch(e) {
      rethrow;
    }
  }
  static Future<void> addCart(String userid, String id) async {
    try {
      final response = await http.post(
          Uri.parse(Utils.apiAddCart),
          headers: {
            "Content-Type": "application/json"
          },
          body: json.encode({
            "userId": userid,
            "productId": id,
            "quantity": 1
          })
      );
      if(response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Đã thêm vào giỏ hàng !", gravity: ToastGravity.TOP);
      }
      else {
        print(response.statusCode);
        Fluttertoast.showToast(msg: "Đã bị lỗi: ${response.statusCode}!", gravity: ToastGravity.TOP);
      }
    }
    catch(e) {
      rethrow;
    }
  }
}