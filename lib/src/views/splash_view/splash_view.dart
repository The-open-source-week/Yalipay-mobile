

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Spacer(),

          const Center(
            child: Text(
              "YaliPay",     
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 48,
                color: Colors.white
              ),
            ),
          ),

          const Center(
            child: Text(
              "Confiança não tem preço\nseu dinheiro está seguro aqui",   
              textAlign: TextAlign.center,  
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.white
              ),
            ),
          ),

          Image.asset(
            handImage,
            height: context.sizeDevice.height / 2,
            width: 236,
          )
        ],
      ),
    );
  }
}