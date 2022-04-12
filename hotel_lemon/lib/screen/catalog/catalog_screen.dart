import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/category_model.dart';
import 'package:hotel_lemon/model/model_barrel.dart';
import 'package:hotel_lemon/widget/bottom_nav_bar.dart';
import 'package:hotel_lemon/widget/product_list_card.dart';

class CatalogScreen extends StatelessWidget {
  static const String? routeName = "/catalog";
  final Category category;

  const CatalogScreen({
    required this.category,
  });

  static Route route({
    required Category category,
  }) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(category.name);
    final List<Product> categoryProduct = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          title: Text(
            category.name,
            style: TextStyle(
              color: Colors.brown,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
      bottomNavigationBar: CustomNavBar(),
      body: ListView.builder(
          itemCount: categoryProduct.length,
          itemBuilder: (context, index) {
            return ProduListCrad(
              products: categoryProduct[index],
            );
          }),
    );
  }
}
