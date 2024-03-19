import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
const url = 'http://10.80.0.109:2000/api/v1';
const kPrimaryColor = Color(0xFF5C6AC4);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

String numberFormatted (int Number) {
  final formattedNumber =   NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(Number);
  return formattedNumber;
}