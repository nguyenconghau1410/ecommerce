import 'package:elma/constants/constant.dart';
import 'package:elma/screens/homeScreen.dart';
import 'package:elma/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboandingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: kWhiteColor,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: 'Shopping now',
            body:
                "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            image: Image.asset(
              'images/splash1.png',
              width: 200,
            ),
            decoration: pageDecoration),
        PageViewModel(
            title: 'Big discount',
            body:
                "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            image: Image.asset(
              'images/splash2.png',
              width: 200,
            ),
            decoration: pageDecoration),
        PageViewModel(
            title: ' Free delivery',
            body:
                "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
            image: Image.asset(
              'images/splash3.png',
              width: 200,
            ),
            decoration: pageDecoration,
            footer: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Let's shop",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55),
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
            ))
      ],
      showSkipButton: true,
      showBackButton: false,
      showDoneButton: true,
      showNextButton: true,
      back: Text(
        'Back',
        style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
      ),
      next: Text(
        'Next',
        style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
      ),
      done: Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
      ),
      skip: Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
      ),
      onDone: () {},
      onSkip: () {},
      dotsDecorator: DotsDecorator(
          size: Size.square(10),
          activeSize: Size(20, 10),
          activeColor: kPrimaryColor,
          color: Colors.black,
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    );
  }
}
