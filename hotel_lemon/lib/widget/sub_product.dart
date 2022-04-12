import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/product_model.dart';
import 'package:hotel_lemon/widget/product_carasoul_list.dart';

import 'section_tile.dart';

class SubProduct extends StatelessWidget {
  const SubProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: SectionTile(title: "Recommended"),
          ),
        ),
        ProductCarassoul(
          products: Product.products
              .where((product) => product.isRecommended)
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: SectionTile(title: "Popular"),
          ),
        ),
        ProductCarassoul(
          products:
              Product.products.where((product) => product.isPopular).toList(),
        ),
      ],
    );
  }
}
