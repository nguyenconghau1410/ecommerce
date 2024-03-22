import 'dart:convert';

import 'package:elma/api/utils.dart';
import 'package:elma/constants/ability.dart';
import 'package:elma/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../screens/navigation.dart';

class APIAuth {
  static Future<void> login(String email, String password, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(Utils.apiLogin),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"email": email, "password_hash": password}));
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        if(data != null) {
          Ability.token = data['token'];
          Ability.user = User.fromMap(data);
          Ability.showSnackbar(context, "Login success");
          Future.delayed(Duration(seconds: 3), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NavigationScreen()));
          });
        }
        else {
          Ability.showSnackbar(context, "Login failed");
        }
      } else {
        Ability.showSnackbar(context, "Error: ${response.statusCode}");
        print(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
  static Future<void> signup(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(Utils.apiSignup),
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode(data)
      );
      if(response.statusCode == 200) {
        final data = json.decode(response.body);
        if(data != null) {
          Fluttertoast.showToast(
            msg: "Đăng ký thành công !",
            gravity: ToastGravity.TOP
          );
        }
        else {
          Fluttertoast.showToast(
              msg: "Đã có lỗi xảy ra !",
              gravity: ToastGravity.TOP
          );
        }
      }
      else {
        print(response.statusCode);
        return;
      }
    }
    catch(e) {
      rethrow;
    }
  }
}
