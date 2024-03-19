import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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

  List<String> mobileBrands = [
    "Samsung",
    "iPhone",
    "Oppo",
    "Sony",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: BackButton(),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: imageList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Slidable(
                        endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: ((context) {}),
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              borderRadius: BorderRadius.circular(20),
                              flex: 1,
                            )
                          ],
                        ),
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              // color: Color(0xFFe7e8ea),
                              color: Color(0xFFf2f2f2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Text(mobileBrands[index],
                                            style: TextStyle(
                                                color: Color(0xFF5C6AC4),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18))
                                      ],
                                    ),
                                    Text(prices[index],
                                        style: TextStyle(
                                            color: Color(0xFF5C6AC4),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18))
                                  ]),
                            )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
