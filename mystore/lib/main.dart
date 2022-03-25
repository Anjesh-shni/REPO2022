import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/cart/cart_page.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/controllers/popular_product_controller.dart';
import 'package:mystore/controllers/recommended_product_controller.dart';
import 'package:mystore/pages/home/mianpage.dart';
import 'package:mystore/pages/home/splash_page/splash_screen.dart';
import 'package:mystore/routes/routes_helper.dart';
import 'helper/dependecies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("-------------App Started---------------");

    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetBuilder<CartController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nvida',
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        });
      });
    });
  }
}
