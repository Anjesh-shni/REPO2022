import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/model_barrel.dart';

class ProductCard extends StatelessWidget {
  final Product products;
  const ProductCard({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product",arguments: products);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width / 3.2,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Image.asset(
                products.imaUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 3.2 - 10,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black.withAlpha(110),
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 10,
            bottom: 10,
            right: 10,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5 - 10,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black.withAlpha(130),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 2),
                            child: Text(
                              products.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${products.price}€",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
