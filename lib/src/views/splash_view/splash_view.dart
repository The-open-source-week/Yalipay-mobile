import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:yalipay/src/models/account_model.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/local_storage.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/intro_text_compoent.dart';
import 'package:yalipay/src/views/home_view/home_view.dart';
import 'package:yalipay/src/views/welcome_view/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> validateSession() async {
    var tokenModel = await YPStorage.getToken();
    var user = await YPStorage.getUserData();
    if (user != null && !JwtDecoder.isExpired(tokenModel.token!)) {
      GoTo.pageWithoutReturn(context, page: const HomeView());
    } else {
      GoTo.pageWithoutReturn(context, page: const WelcomeView());
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      validateSession();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const IntroTextComponent(),
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            YPUtils.handImage,
            height: context.sizeDevice.height / 2,
            width: 236,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
