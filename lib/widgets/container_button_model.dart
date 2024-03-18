import 'package:elma/constants/constant.dart';
import 'package:flutter/material.dart';

class ContainerButtonModel extends StatelessWidget {
  final double? containerWidth;
  final String itext;
  final Color? bgColor;
  final Color? frColor;

  const ContainerButtonModel(
      {super.key,
      this.containerWidth,
      required this.itext,
      required this.bgColor,
      required this.frColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: kPrimaryColor),
      child: Center(
        child: Text(
          itext,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
