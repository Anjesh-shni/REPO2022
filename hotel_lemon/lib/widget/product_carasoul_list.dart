import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/product_model.dart';
import 'package:hotel_lemon/widget/product_list_card.dart';

class ProductCarassoul extends StatelessWidget {
  final List<Product> products;
  
  const ProductCarassoul({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProduListCrad(
              products: products[index],
            );
          }),
    );
  }
}
