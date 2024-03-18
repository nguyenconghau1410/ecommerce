import 'package:elma/constants/constant.dart';
import 'package:elma/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // Sign up user
  void signUpUser(
      {required String email,
      required String password,
      required String name,
      required int phone}) async {
    try {
      User user = User('avatar', name, email, password, 'street', 'city', 'zip',
          'country', false, phone, [], DateTime.now());

      http.Response res = await http.post(Uri.parse('$url/users/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          });

      print(res.statusCode);
      print(res.body);
    } catch (error) {}
  }
}
