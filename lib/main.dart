import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/cards_controller.dart';
import 'package:yalipay/src/controllers/global_controller.dart';
import 'package:yalipay/src/controllers/home_controller.dart';
import 'package:yalipay/src/views/app_view.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    colors: true,
  ),
);
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => GlobalController(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeController(),
      ),
      ChangeNotifierProvider(
        create: (context) => CardsController(),
      ),
    ],
    child: const AppView(),
  ));
}
