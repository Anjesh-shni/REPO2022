import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/data/repository/auth_repo.dart';
import 'package:mystore/models/sign_up_body.dart';

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
