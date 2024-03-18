import 'package:elma/constants/ultils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle(
    {required http.Response res,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, 'Error 400: $res');
      break;
    case 500:
      showSnackBar(context, 'Error in server');
    default:
      showSnackBar(context, res.body);

  }
}
