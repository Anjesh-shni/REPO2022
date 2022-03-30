import 'package:brocklyn_cafe/data/api/api_client.dart';
import 'package:brocklyn_cafe/utils/app_constant.dart';
import 'package:get/get.dart';


class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
