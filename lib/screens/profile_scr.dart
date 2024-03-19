import 'package:flutter/material.dart';

import '../constants/constant.dart';
import 'favoriteScreen.dart';
import 'homeScreen.dart';

class ProfileScr extends StatefulWidget {
  const ProfileScr({super.key});

  @override
  State<ProfileScr> createState() => _ProfileScrState();
}

class _ProfileScrState extends State<ProfileScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  child: Image(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -60,
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5),
                        image: DecorationImage(
                            image: AssetImage("images/profile.jpg"))),
                  ),
                ),
                Positioned(
                    bottom: -95,
                    child: Text("User name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)))
              ]),
          Column(
            children: [
              SizedBox(
                height: 110,
              ),
              ListTile(
                leading: Icon(Icons.person, color: kPrimaryColor, size: 32),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.playlist_add_check_circle,
                    color: kPrimaryColor, size: 32),
                title: Text(
                  "Order",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: kPrimaryColor, size: 32),
                title: Text(
                  "Favorite",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteScreen(),
                      ));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.logout, color: kPrimaryColor, size: 32),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
