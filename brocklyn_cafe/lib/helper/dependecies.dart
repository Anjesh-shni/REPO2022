import 'package:brocklyn_cafe/controllers/auth_controller.dart';
import 'package:brocklyn_cafe/controllers/cart_controller.dart';
import 'package:brocklyn_cafe/controllers/popular_product_controller.dart';
import 'package:brocklyn_cafe/controllers/recommended_product_controller.dart';
import 'package:brocklyn_cafe/data/api/api_client.dart';
import 'package:brocklyn_cafe/data/repository/auth_repo.dart';
import 'package:brocklyn_cafe/data/repository/cart_repo.dart';
import 'package:brocklyn_cafe/data/repository/popular_product_repo.dart';
import 'package:brocklyn_cafe/data/repository/recommended_product_repo.dart';
import 'package:brocklyn_cafe/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //shredPrefrences
  final sharedPrefrences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPrefrences);

  //api clienet
  Get.lazyPut(
    () => ApiClient(appBaseUrl: AppConstants.BASE_URL),
  );

  //Auth reepo
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  //for repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //for controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));

  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
