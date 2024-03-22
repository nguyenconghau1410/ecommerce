import 'package:elma/api/api_products.dart';
import 'package:elma/screens/productScreen.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../models/products.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controler = TextEditingController();
  final focusNode = FocusNode();
  String keyword = "";
  Future<List<Product>> search() async {
    return APIProduct.getListByKeywor(keyword);
  }
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.keyboard_backspace, color: Colors.grey,),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: controler,
                      focusNode: focusNode,
                      onChanged: (value) {
                        setState(() {
                          keyword = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Find your product',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 0,
                        ),
                      ),

                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
              const SizedBox(height: 10,),
              keyword != ""
                  ? FutureBuilder(
                future: search(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final data = snapshot.data;
                    return Expanded(child: GridView.builder(
                        itemCount: data!.length,
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 2,
                          // mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ListCategory(data[index]!);
                        }));
                  }
                },
              )
                  : Container()
            ],
          ),
        )
      ),
    );
  }
  Widget ListCategory(Product product) {
    return InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(product: product,),
              ));
        },
        child:  Center(
          child: Container(
            width: 200,
            margin: const EdgeInsets.only(right: 15, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           ProductScreen(),
                          //     ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            product.image!,
                            width: 180,
                            height: 220,
                            fit: BoxFit.cover,
                            // height: 180,
                            // width: 150,
                            // fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 190,
                  child: Text(
                    product.name!,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      numberFormatted(product.price!.first),
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.star, color: Colors.yellow, size: 12),
                    Text('(' + "${product.rating!}" + ')',
                        style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
