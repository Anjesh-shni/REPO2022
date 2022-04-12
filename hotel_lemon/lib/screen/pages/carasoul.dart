import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/model_barrel.dart';
import 'package:hotel_lemon/widget/widget_barrel_file.dart';

class Carasoul extends StatelessWidget {
  final Product products;
  const Carasoul({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CategoryColumn(),
        // SubProduct(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.6,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items: Category.categories
                .map(
                  (categories) => HeroCarasoul(categories: categories),
                )
                .toList(),
          ),
        ),

        SectionTile(title: "Recommended"),
        ProductCarassoul(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList()),
        SectionTile(title: "Popular"),
        ProductCarassoul(
            products: Product.products
                .where((product) => product.isPopular)
                .toList()),
        SectionTile(title: "Recently added"),
        ProductCarassoul(
            products: Product.products
                .where(
                  (product) => product.isRecentlyadded,
                )
                .toList()),
        SectionTile(title: "Drink"),
        ProductCarassoul(
          products:
              Product.products.where((product) => product.isDrink).toList(),
        ),
      ],
    );
  }
}
