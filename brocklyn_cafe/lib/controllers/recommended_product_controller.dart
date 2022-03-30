import 'package:brocklyn_cafe/data/repository/recommended_product_repo.dart';
import 'package:brocklyn_cafe/models/popular_product_mooel.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("Got recommended product");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isloaded = true;
      // print("..................................................");
      // print(_recommendedProductList.toList());

      update();
    } else {
      print("could not get recommended product");
    }
  }
}
