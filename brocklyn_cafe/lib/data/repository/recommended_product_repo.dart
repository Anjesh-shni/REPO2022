import 'package:brocklyn_cafe/data/api/api_client.dart';
import 'package:brocklyn_cafe/utils/app_constant.dart';
import 'package:get/get.dart';


class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMENDED_PRODUCT_URI);
  }
}
