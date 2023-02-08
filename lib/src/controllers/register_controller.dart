import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/main.dart';
import 'package:yalipay/src/utils/api_helper.dart';

class RegisterController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numeroDeTelefoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future<void> register() async {
    try {
      var _response = await APIHelper.dio.post(
        APIRoutes.register,
        data: {
          "email": emailController.text,
          "password": passwordController.text,
          "phoneNumber": numeroDeTelefoneController.text,
          "username": userNameController.text,
        },
      );
      logger.i(_response.data);
    } on DioError catch (e) {
      logger.i(e.error);
      logger.e(e.response!.statusMessage);
    }
  }
}
