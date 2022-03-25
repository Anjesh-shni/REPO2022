import 'dart:ffi';
import 'package:get/get.dart';
import 'package:pos_app/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  Void? onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 3));
    var productResult = [
      Product(
          id: 1,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 2,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 3,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 4,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 5,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 6,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 7,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 8,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 9,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
      Product(
          id: 10,
          productName: 'Apple',
          description: ' Sweetest Kashmiri Apple',
          price: 10,
          qty: 1),
    ];
    products.value = productResult;
  }
}
