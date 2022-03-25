import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/data/repository/popular_product_repo.dart';
import 'package:mystore/models/cart_model.dart';
import 'package:mystore/models/popular_product_mooel.dart';
import 'package:mystore/widget/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem + quantity;

  Future<void> getPopulaProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got popular product");

      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print("......................" + _popularProductList.toString());
      _isloaded = true;

      update();
    } else {
      print("Didn't get popular product");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar(
        "Product count",
        "You Can't reduce more!",
        backgroundColor: ApClrs.mainClr,
        colorText: Colors.black,
      );
      if (_inCartItem > 0) {
        _quantity = -_quantity;
        return quantity;
      }
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItem + quantity) > 20) {
      Get.snackbar(
        "Product count",
        "You Can't add more!",
        backgroundColor: ApClrs.mainClr,
        colorText: Colors.black,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.isExistInCart(product);
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
