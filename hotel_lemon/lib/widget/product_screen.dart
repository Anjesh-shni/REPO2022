import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/product_model.dart';
import 'package:hotel_lemon/widget/custom_app_bar.dart';
import 'package:hotel_lemon/widget/widget_barrel_file.dart';

class ProductScreen extends StatelessWidget {
  final Product products;
  const ProductScreen({Key? key, required this.products}) : super(key: key);

  static const String routeName = "/product";
  static Route route({required Product products}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(products: products),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBAr(
        title: products.name,
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
