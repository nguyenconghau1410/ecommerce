import 'package:elma/api/api_cart.dart';
import 'package:elma/constants/ability.dart';
import 'package:elma/constants/constant.dart';
import 'package:elma/screens/paymentMethod.dart';
import 'package:elma/services/cart_controller.dart';
import 'package:elma/widgets/container_button_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/cart.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartController> cartControl = [];
  bool selectAll = false;
  Future<void> getCart() async {
    List<Cart> carts = await APICart.getCart(Ability.user!.id!);
    setState(() {
      List<CartController> temp = [];
      carts.forEach((element) {
        CartController cartController = CartController();
        cartController.init(element);
        temp.add(cartController);
      });
      cartControl = temp;
    });
  }

  int caculate() {
    int sum = 0;
    cartControl.forEach((element) {
      sum += element.cart!.product!.price!.first * element.cart!.quantity!;
    });
    return sum;
  }

  @override
  void initState() {
    super.initState();
    getCart();
  }

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
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(cartControl.length, (index) {
                      return cartItem(cartControl[index]);
                    }),
                  ),
                ),
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
                      value: selectAll,
                      onChanged: (val) {
                        setState(() {
                          selectAll = !selectAll;
                          cartControl.forEach((element) {
                            element.clicked = selectAll;
                          });
                        });
                      })
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
                    numberFormatted(caculate()),
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
      )
    );
  }

  Widget cartItem(CartController cartController) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
            children: [
              Checkbox(
                  splashRadius: 20,
                  activeColor: Color(0xFF5C6AC4),
                  value: cartController.clicked,
                  onChanged: (val) {
                    setState(() {
                      cartController.onClick();
                    });
                  }),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cartController.cart!.product!.image!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      cartController.cart!.product!.name!,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(numberFormatted(cartController.cart!.product!.price!.first),
                      style: TextStyle(
                          color: Color(0xFF5C6AC4),
                          fontWeight: FontWeight.w900,
                          fontSize: 16)),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(cartController.cart!.quantity == null) {
                              cartController.cart!.quantity = 1;
                            }
                            else {
                              if(cartController.cart!.quantity! - 1 <= 0) {
                                cartController.cart!.quantity = 1;
                              }
                              else {
                                int temp = cartController.cart!.quantity! - 1;
                                cartController.cart!.quantity = temp;
                              }
                            }
                          });
                        },
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: Color(0xFF5C6AC4),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        width: 30,
                        height: 30,
                        color: Color.fromARGB(255, 227, 224, 224),
                        child: Center(child: Text(cartController.cart!.quantity.toString(), style: TextStyle(color: Color(0xFF5C6AC4)),),),
                      ),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            cartController.cart!.quantity = cartController.cart!.quantity == null ? 0 : cartController.cart!.quantity! + 1;
                          });
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Color(0xFF5C6AC4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]
        )
    );
  }

}
