import 'package:elma/constants/constant.dart';
import 'package:elma/screens/paymentMethod.dart';
import 'package:elma/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List imageList = [
    "images/Ip15.jpg",
    "images/lapdell.jpg",
    "images/pc.jpg",
    "images/Sony.jpg",
  ];

  List productTitles = ["Mobile", "Laptop", "PC", "Air"];

  List reviews = ["54", "100", "789", "34"];
  List quantity = ["54", "100", "789", "34"];

  List prices = ["1.300.000", "1.300.000", "1.300.000", "1.300.000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                    splashRadius: 20,
                                    activeColor: Color(0xFF5C6AC4),
                                    value: true,
                                    onChanged: (val) {}),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imageList[index],
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productTitles[index],
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(prices[index],
                                        style: TextStyle(
                                            color: Color(0xFF5C6AC4),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18))
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Icon(
                                //       CupertinoIcons.minus,
                                //       color: Colors.green,
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text(
                                //       "1",
                                //       style: TextStyle(
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w700,
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Icon(
                                //       CupertinoIcons.plus,
                                //       color: Colors.green,
                                //     )
                                //   ],
                                // )
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity[index] > 0) {
                                              quantity[index]--;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_circle_outline,
                                          color: Color(0xFF5C6AC4),
                                        )),
                                    Container(
                                        width: 35,
                                        height: 35,
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        child: TextField(
                                          enabled: false,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  quantity[index].toString(),
                                              hintStyle: TextStyle(
                                                  color: Color(0xFF5C6AC4))),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            // Max 5
                                            if (quantity[index] <= 100) {
                                              quantity[index]++;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          color: Color(0xFF5C6AC4),
                                        )),
                                  ],
                                )
                              ]));
                    }),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Checkbox(
                      splashRadius: 20,
                      activeColor: Color(0xFF5C6AC4),
                      value: false,
                      onChanged: (val) {})
                ],
              ),
              Divider(
                height: 20,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\$300.50",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF5C6AC4),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => PaymentMethod()));
                },
                child: ContainerButtonModel(
                  itext: "Checkout",
                  containerWidth: MediaQuery.of(context).size.width,
                  bgColor: Color(0xFF5C6AC4),
                  frColor: kWhiteColor,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
