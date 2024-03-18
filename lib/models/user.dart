// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
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
  DateTime dateCreated;

  User(
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
    this.dateCreated,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      'dateCreated': dateCreated.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
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
      map['likedProducts'],
      DateTime.fromMillisecondsSinceEpoch(map['dateCreated'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
