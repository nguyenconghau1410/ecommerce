import 'package:elma/constants/constant.dart';
import 'package:elma/screens/login.dart';
import 'package:elma/screens/onboadingScreen.dart';
import 'package:elma/screens/signup.dart';
import 'package:elma/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elma ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor),
      home: SplashScreen(),
    );
  }
}
