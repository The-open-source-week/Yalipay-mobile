import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';

class CustomAppBarComponent extends StatelessWidget {
  final bool showShadowAppBar;
  const CustomAppBarComponent({super.key, required this.showShadowAppBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorBlackBG,
        boxShadow: showShadowAppBar
          ? const [
              BoxShadow(
                color: Color(0xFF000000),
                offset: Offset(0.0, 5.0),
                blurRadius: 5)
            ]
          : null
        ),
      child: const Text(
        "YaliPay",
        style: TextStyle(
          fontWeight: FontWeight.w700, 
          fontSize: 15
        ),
      ),
    );
  }
}
