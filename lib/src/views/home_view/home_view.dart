

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/credit_card_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.sizeDevice.height,
          width: context.sizeDevice.width,
          padding: const EdgeInsets.symmetric(
            vertical: 43,
            horizontal: 23
          ),
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                color: colorBlackBG,
                child: const Text(
                  "YaliPay",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [

                    CreditCardComponent()

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}