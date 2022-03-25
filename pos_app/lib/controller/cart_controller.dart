import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;

  var isDark = false;

  get productss => cartItems;

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }

  removeToCart(Product product) {
    cartItems.remove(product);
  }

  void changeTheme(state) {
    if (state == true) {
      isDark = true;
      changeTheme(ThemeData.dark());
    } else {
      isDark = false;
      changeTheme(ThemeData.light());
    }
    update();
  }
}
