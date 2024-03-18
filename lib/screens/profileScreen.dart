import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> fetchData() async {
      try {
        final response =
            await http.get(Uri.parse('http://localhost:2000/api/v1/users'));

        if (response.statusCode == 200) {
          // Nếu cuộc gọi thành công, giải mã dữ liệu JSON.
          final List<dynamic> jsonData = json.decode(response.body);

          // In dữ liệu ra console.
          for (var user in jsonData) {
            print('User ID: ${user['id']}');
            print('User Name: ${user['name']}');
            // Thêm các trường khác tùy thuộc vào cấu trúc JSON của bạn.
          }
        } else {
          // Nếu cuộc gọi thất bại, in lỗi ra console.
          print('Failed to load data. Error ${response.statusCode}');
        }
      } catch (e) {
        // Xử lý các lỗi khác nếu có.
        print('Error: $e');
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(fetchData().toString()),
        ],
      ),
    );
  }
}
