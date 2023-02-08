import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/main.dart';
import 'package:yalipay/src/utils/api_helper.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      var _response = await APIHelper.dio.post(
        APIRoutes.login,
        data: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      logger.i(_response.data);
    } on DioError catch (e) {
      logger.e(e.error);
    }
  }
}
