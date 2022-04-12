<<<<<<< HEAD
import 'package:brocklyn_cafe/cart/cart_history_page.dart';
import 'package:brocklyn_cafe/cart/cart_page.dart';
import 'package:brocklyn_cafe/pages/home/home_nav.dart';
import 'package:brocklyn_cafe/pages/more_page/category.dart';
import 'package:brocklyn_cafe/pages/splash/splash_screen1.dart';
import 'package:get/get.dart';
=======
import 'package:brocklyn_cafe/category_product/reco_product.dart';
import 'package:brocklyn_cafe/pages/splash/splash_screen1.dart';
import 'package:get/get.dart';
import '../main.dart';

>>>>>>> parent of 4fe81b25 (today)

class RouteHelper {
  static const String inittial = "/";
  static const String inittialsec = "/MyStatefulWidget";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String cartHistory = "/cart-history";
  //category
  static const String recoCategory = "/reco-category";

  // with page id
  static String getSplashPage() => "$splashPage";
  static String getInitial() => "$inittial";
  static String getinittialsec() => "$inittialsec";

  static String getPopularFood(
          // int pageId, String page
          ) =>
      popularFood;
  // "$popularFood?pageId=$pageId&page=$page";

  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";

  static String getCartPage() => '$cartPage';
  static String getCartHistory() => '$cartHistory';
  //category

  static String getrecoCategory(int pageId, String page) =>
      "$recoCategory?pageId=$pageId&page=$page";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: inittial, page: () => HomePage()),
    // GetPage(name: inittialsec, page: () => MyStatefulWidget()),
<<<<<<< HEAD
    GetPage(
        name: popularFood,
        page: () {
          // var pageId = Get.parameters["pageId"];
          // final page = Get.parameters["page"];
          return CategoryPage(
              // pageId: int.parse(pageId!), page: page!
              );
        },
        transition: Transition.downToUp),
    // GetPage(
    //     name: recoCategory,
    //     page: () {
    //       var pageId = Get.parameters["pageId"];
    //       final page = Get.parameters["page"];
    //       return RecoCategoryList(pageId: int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.downToUp),
=======
    // GetPage(
    //     name: popularFood,
    //     page: () {
    //       var pageId = Get.parameters["pageId"];
    //       final page = Get.parameters["page"];
    //       return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.downToUp),
    GetPage(
        name: recoCategory,
        page: () {
          var pageId = Get.parameters["pageId"];
          final page = Get.parameters["page"];
          return RecoCategoryList(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.downToUp),
>>>>>>> parent of 4fe81b25 (today)

    // GetPage(
    //     name: recommendedFood,
    //     page: () {
    //       var pageId = Get.parameters["pageId"];
    //       final page = Get.parameters["page"];
    //       return RecommendedFoodDetails(
    //           pageId: int.parse(pageId!), page: page!);
    //     },
    //     transition: Transition.downToUp),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartHistory();
      },
      transition: Transition.downToUp,
    ),
  ];
}
