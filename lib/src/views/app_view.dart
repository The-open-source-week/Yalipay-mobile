import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/views/splash_view/splash_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YaliPay",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: YPUtils.colorYellow,
          scaffoldBackgroundColor: YPUtils.colorBlackBG,
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontFamily: YPUtils.fontPoppins),
          )),
      home: const SplashView(),
    );
  }
}
