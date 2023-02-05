import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
//import 'package:yalipay/src/views/splash_view/splash_view.dart';
import 'package:yalipay/src/views/verification_pin_view/verification_pin_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YaliPay",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: colorYellow,
        scaffoldBackgroundColor: colorBlackBG,
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: fontPoppins),
        )
      ),
      home: const VerificationPinView(),
    );
  }
}