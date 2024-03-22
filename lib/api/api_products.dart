import 'dart:convert';
import 'dart:math';

import 'package:elma/api/utils.dart';
import 'package:elma/models/products.dart';
import 'package:http/http.dart' as http;

class APIProduct {
  static Future<List<Product>> getListProduct() async {
    try {
      final response = await http.get(Uri.parse(Utils.apiGetProducts));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        List<Product> products = [];
        data.forEach((element) {
          if (element["isBestSeller"] == true) {
            products.add(Product.fromJson(element));
          }
        });
        print(products.length);
        return products;
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      rethrow;
      print(e.toString());
    }
  }

  static Future<List<Product>> getListProductCategory(String categoryId) async {
    try {
      final response = await http.get(
          Uri.parse("${Utils.apiGetProductbyCategoryId}/$categoryId"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        List<Product> products = [];
        data.forEach((element) {
          products.add(Product.fromJson(element));
        });
        return products;
      }
      else {
        print(response.statusCode);
        return [];
      }
    }
    catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> getListProduct1() async {
    try {
      final response = await http.get(Uri.parse(Utils.apiGetProducts));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        List<Product> products = [];
        data.forEach((element) {
          products.add(Product.fromJson(element));
        });
        Random random = Random();
        int a = random.nextInt(products.length - 20);
        List<Product> hintProduct = [];
        for(int i = a; i <= a + 20; i++) {
          hintProduct.add(products[i]);
        }
        return hintProduct;
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> getListByKeywor(String keyword) async {
    try {
      final response = await http.get(Uri.parse(Utils.apiSearchByKeyword).replace(queryParameters: {"key": keyword}));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        List<Product> products = [];
        data.forEach((element) {
          products.add(Product.fromJson(element));
        });
        return products;
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
