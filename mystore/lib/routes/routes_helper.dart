import 'package:get/get.dart';
import 'package:mystore/cart/cart_page.dart';
import 'package:mystore/category_product/reco_product.dart';
import 'package:mystore/pages/home/check.dart';
import 'package:mystore/pages/home/food/popular_food_details.dart';
import 'package:mystore/pages/home/food/recomended_food_detai.dart';
import 'package:mystore/pages/home/home_page.dart';
import 'package:mystore/pages/home/mianpage.dart';
import 'package:mystore/pages/home/splash_page/splash_screen.dart';
import 'package:mystore/pages/home/splash_page/splash_screen1.dart';

class RouteHelper {
  static const String inittial = "/";
  static const String inittialsec = "/MyStatefulWidget";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  //category
   static const String recoCategory = "/reco-category";

  // with page id
  static String getSplashPage() => "$splashPage";
  static String getInitial() => "$inittial";
   static String getinittialsec() => "$inittialsec";

  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";

  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";

  static String getCartPage() => '$cartPage';
  //category 

  static String getrecoCategory(int pageId, String page) =>
      "$recoCategory?pageId=$pageId&page=$page";



 


  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: inittial, page: () => HomePage()),
    GetPage(name: inittialsec, page: () => MyStatefulWidget()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          final page = Get.parameters["page"];
          return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.downToUp),
    GetPage(
        name: recoCategory,
        page: () {
          var pageId = Get.parameters["pageId"];
          final page = Get.parameters["page"];
          return RecoCategoryList(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.downToUp),



    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          final page = Get.parameters["page"];
          return RecommendedFoodDetails(
              pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.downToUp),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.downToUp,),
  ];
}
