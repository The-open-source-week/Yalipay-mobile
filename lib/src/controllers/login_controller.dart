// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/main.dart';
import 'package:yalipay/src/controllers/global_controller.dart';
import 'package:yalipay/src/models/account_model.dart';
import 'package:yalipay/src/models/token_model.dart';
import 'package:yalipay/src/utils/api_helper.dart';
import 'package:yalipay/src/utils/local_storage.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/views/home_view/home_view.dart';

class LoginController extends ChangeNotifier {
  GlobalController _globalController = GlobalController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    try {
      AccountModel data = AccountModel(
          email: emailController.text, password: passwordController.text);
      var _response =
          await APIHelper.dio.post(APIRoutes.login, data: data.loginBody());
      TokenModel tokenModel = TokenModel.fromJson(_response.data);
      if (tokenModel != null) {
        YPStorage.storeToken(tokenModel);
        _globalController.user = YPStorage.getUserData();
        GoTo.pageWithoutReturn(context, page: const HomeView());
        notifyListeners();
      }
    } on DioError catch (e) {
      logger.e(e.error);
    }
  }
}
