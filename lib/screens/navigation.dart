import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:elma/constants/constant.dart';
import 'package:elma/screens/cartScreen.dart';
import 'package:elma/screens/favoriteScreen.dart';
import 'package:elma/screens/homeScreen.dart';
import 'package:elma/screens/profile_scr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScr()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
          child: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.qr_code,
          size: 20,
        ),
        foregroundColor: kWhiteColor,
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            CupertinoIcons.home,
            CupertinoIcons.cart,
            CupertinoIcons.heart,
            CupertinoIcons.profile_circled
          ],
          activeIndex: pageIndex,
          activeColor: kPrimaryColor,
          inactiveColor: Colors.black.withOpacity(0.5),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          iconSize: 25,
          rightCornerRadius: 10,
          elevation: 0,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          }),
    );
  }
}
