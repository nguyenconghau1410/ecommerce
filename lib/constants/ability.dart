import 'package:elma/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ability {
  static String? token;
  static User? user;

  static showSnackbar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(content, style: TextStyle(color: Colors.white, fontSize: 14),),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Xử lý khi nhấn vào nút đóng
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    // Hiển thị snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}