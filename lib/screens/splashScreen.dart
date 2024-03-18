import 'dart:async';

import 'package:elma/constants/constant.dart';
import 'package:elma/screens/homeScreen.dart';
import 'package:elma/screens/onboadingScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboandingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/image.png"),
            fit: BoxFit.cover,
            opacity: 0.4,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 200,
            color: kPrimaryColor,
          ),
          Text(
            'Elma ecommerce',
            style: TextStyle(
                fontFamily: 'Roboto',
                color: kWhiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.none),
          )
        ],
      ),
    );
  }
}
