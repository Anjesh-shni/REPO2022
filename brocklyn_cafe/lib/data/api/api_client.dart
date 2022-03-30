import 'package:brocklyn_cafe/utils/app_constant.dart';
import 'package:get/get.dart';


class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 10);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8 ",
      "Authoraization": "Bearer $token",
    };
  }
  void updateHeader(String token){
       _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8 ",
      "Authoraization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
