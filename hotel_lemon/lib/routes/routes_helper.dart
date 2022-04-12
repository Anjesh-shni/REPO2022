import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/category_model.dart';
import 'package:hotel_lemon/model/model_barrel.dart';
import 'package:hotel_lemon/screen/cart_page/cart_page.dart';
import 'package:hotel_lemon/screen/catalog/catalog_screen.dart';
import 'package:hotel_lemon/screen/checkout/checkout_screen.dart';
import 'package:hotel_lemon/screen/screen_barrel.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("Route is: ${settings.name}");

    switch (settings.name) {
      case "/":
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartSaveData.routeName:
        return CartSaveData.route();
      case CartPage.routeName:
        return CartPage.route();
      case UserProfiles.routeName:
        return UserProfiles.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case UserProfiles.routeName:
        return UserProfiles.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case CategoryColumn.routeName:
        return CategoryColumn.route(category:settings.arguments as Category,product:settings.arguments as Product, );

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: "/Error"),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          elevation: 10,
          title: Center(child: Text("Something went wrong!!!")),
        ),
      ),
    );
  }
}
