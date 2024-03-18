import 'package:elma/constants/constant.dart';
import 'package:elma/widgets/container_button_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductDetailPopup extends StatelessWidget {
  final iStyle = TextStyle(
      color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Size: ", style: iStyle)],
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 2.5,
        itext: "Buy Now",
        bgColor: kPrimaryColor,
        frColor: kWhiteColor,
      ),
    );
  }
}
