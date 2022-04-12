import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/category_model.dart';
import 'package:hotel_lemon/model/model_barrel.dart';

class CategoryColumn extends StatelessWidget {
  final Product products;
  final Category categories;
  const CategoryColumn({
    Key? key,
    required this.categories,
    required this.products,
  }) : super(key: key);

  static const String routeName = "/";
  static Route route({required Category category, required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CategoryColumn(
        categories: category,
        products: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: double.infinity,
          color: Colors.green.shade300,
          child: Center(
            child: Text(
              "Category",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/catalog",
              arguments: categories,
            );
          },
          child: Container(
            height: 585,
            child: ListView.builder(
                itemCount: Category.categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      color: Colors.green.shade100,
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              child: Image.asset(
                                Category.categories[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 20, left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 80,
                              width: double.infinity,
                              child: Text(
                                Category.categories[index].name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              "tap to see all items",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
