import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/views/credit_card_view/credit_card_view.dart';

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
      home: const CreditCardView(),
    );
  }
}