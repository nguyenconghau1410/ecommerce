import 'dart:convert';

import 'package:elma/api/utils.dart';
import 'package:elma/constants/ability.dart';
import 'package:elma/models/user.dart';
import 'package:http/http.dart' as http;

class APIAuth {
  static Future<User?> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(Utils.apiLogin),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"email": email, "password_hash": password}));
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        Ability.token = data['token'];
        Ability.user = User.fromMap(data);
        return User.fromMap(data);
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
