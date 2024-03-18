import 'package:elma/constants/constant.dart';
import 'package:elma/models/category.dart';
import 'package:elma/screens/allProductsScreen.dart';
import 'package:flutter/material.dart';

import '../api/apiCategories.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  Future<List<Categories>> getCategories() async {
    return APICategory.getListCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: kPrimaryColor,
                        ),
                        border: InputBorder.none,
                        label: Text(
                          'Find your product',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.notifications,
                        color: Color(0xFF5C6AC4),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: getCategories(),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final data = snapshot.data;
                  return GridView.builder(
                    itemCount: data!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1, // Tỉ lệ chiều rộng và chiều cao của item
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                        return allcategories(data![index]);
                    },
                  );
                }
              }
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget allcategories(Categories categories){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllProductsScreen(categories: categories,),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 150, // Chiều cao của item
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            )
          ],
          image: DecorationImage(
            image: NetworkImage(categories.icon!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Hình ảnh
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.6), // Màu tối với độ mờ
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Chữ
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    categories.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
