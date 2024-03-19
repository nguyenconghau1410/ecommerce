// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? id;
  String? avatar;
  String? name;
  String? email;
  String? password;
  String? street;
  String? city;
  String? zip;
  String? country;
  bool? is_admin;
  int? phone;
  List<String>? likedProducts;

  User(
    this.id,
    this.avatar,
    this.name,
    this.email,
    this.password,
    this.street,
    this.city,
    this.zip,
    this.country,
    this.is_admin,
    this.phone,
    this.likedProducts,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'name': name,
      'email': email,
      'password': password,
      'street': street,
      'city': city,
      'zip': zip,
      'country': country,
      'is_admin': is_admin,
      'phone': phone,
      'likedProducts': likedProducts,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    List<String> likedProducts = [];
    for(String x in map['likedProducts']) {
      likedProducts.add(x);
    }
    return User(
      map['id'],
      map['avatar'],
      map['name'],
      map['email'],
      map['password'],
      map['street'],
      map['city'],
      map['zip'],
      map['country'],
      map['is_admin'],
      map['phone'],
      likedProducts,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
