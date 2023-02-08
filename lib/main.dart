import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/global_controller.dart';
import 'package:yalipay/src/views/app_view.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    colors: true,
  ),
);
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalController(),
      child: const AppView(),
    ),
  );
}
