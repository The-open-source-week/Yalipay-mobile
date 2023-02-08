import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/main.dart';
import 'package:yalipay/src/models/account_model.dart';
import 'package:yalipay/src/utils/api_helper.dart';
import 'package:yalipay/src/utils/local_storage.dart';
import 'package:yalipay/src/utils/navigator_util.dart';

import '../views/login_view/login_view.dart';

class RegisterController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numeroDeTelefoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future<void> register(BuildContext context) async {
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
      AccountModel user = AccountModel.fromJson(_response.data);
      // ignore: use_build_context_synchronously
      if (user != null) {
        YPStorage.storeUserData(user);
        GoTo.page(context, page: const LoginView());
      }
    } on DioError catch (e) {
      logger.i(e.error);
      logger.e(e.response!.statusMessage);
    }
  }
}
