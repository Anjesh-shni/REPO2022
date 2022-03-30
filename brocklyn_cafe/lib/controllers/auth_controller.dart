import 'package:brocklyn_cafe/data/repository/auth_repo.dart';
import 'package:brocklyn_cafe/models/sign_up_body.dart';
import 'package:get/get.dart';


class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUpBody signUpBody) async {
    _isLoading = true;
    authRepo.registration(SignUpBody, signUpBody);
    Response response = await authRepo.registration(SignUpBody, signUpBody);
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      
    } else {

    }
  }
}
