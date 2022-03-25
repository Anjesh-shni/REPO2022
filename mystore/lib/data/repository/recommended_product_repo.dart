import 'package:get/get.dart';
import 'package:mystore/data/api/api_client.dart';
import 'package:mystore/utils/app_constant.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMENDED_PRODUCT_URI);
  }
}
