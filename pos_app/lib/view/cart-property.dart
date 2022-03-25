import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/controller/cart_controller.dart';
import 'package:pos_app/controller/shopping_controller.dart';
import 'package:pos_app/model/product.dart';

class CartList extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  final CartController controller;
  final Product product;
  final int qty;
  final int index;
  CartList(
      {Key? key,
      required this.controller,
      required this.product,
      required this.qty,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(builder: (controller) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.productName),
              Text("\$${product.price}"),
              Text(product.description),
              IconButton(
                onPressed: () {
                  cartController.removeToCart(controller.productss[index]);
                },
                icon: Icon(Icons.remove_circle),
              ),
              Text("$qty"),
              IconButton(
                onPressed: () {
                  cartController.addToCart(controller.productss[index]);
                },
                icon: Icon(
                  Icons.add_circle,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
