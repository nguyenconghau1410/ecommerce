import 'package:elma/constants/constant.dart';
import 'package:flutter/material.dart';

class BannerScreen extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlide;

  final List<String> imageUrls = [
    "images/splash.png",
    "images/banner1.png",
    "images/banner2.png",
    "images/banner3.jpg",
  ];

   BannerScreen({
    super.key,
    required this.onChange,
    required this.currentSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: onChange,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 163, 171, 232),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(imageUrls[index])
                    )),
              );
            },
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlide == index
                        ? kWhiteColor
                        : Colors.transparent,
                    border: Border.all(color: kWhiteColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
