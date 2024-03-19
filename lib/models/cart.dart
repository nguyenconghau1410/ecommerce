import 'package:elma/models/products.dart';

class Cart {
  Product? product;
  int? quantity;

  Cart(this.product, this.quantity);

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(Product.fromJson(json["productId"]), json['quantity']);
  }
}