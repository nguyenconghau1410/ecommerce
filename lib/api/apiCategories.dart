import 'dart:convert';

import 'package:elma/api/utils.dart';
import 'package:elma/models/category.dart';
import 'package:http/http.dart' as http;

class APICategory {
  static Future<List<Categories>> getListCategory() async {
    try {
      final response = await http.get(Uri.parse(Utils.apiGetCategories));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Categories> categories = [];
        data.forEach((element) {
          categories.add(Categories.fromJson(element));
        });
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
