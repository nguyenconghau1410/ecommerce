import 'package:elma/api/apiCategories.dart';
import 'package:elma/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future<List<Categories>> getCategories() async {
    return APICategory.getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    data!.length, (index) => category(data[index])),
              ),
            );
          }
        });
  }

  Widget category(Categories categories) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                categories.icon!,
                width: 40,
                height: 40,
                fit: BoxFit.fill),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 50,
            child: Text(
              categories.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
