import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';

class IntroTextComponent extends StatelessWidget {
  final bool vault;
  const IntroTextComponent({super.key, this.vault = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "YaliPay",
            style: TextStyle(
                fontFamily: YPUtils.fontPoppinsMedium,
                fontWeight: FontWeight.w700,
                fontSize: 48,
                color: Colors.white),
          ),
        ),
        vault
            ? const SizedBox()
            : const Center(
                child: Text(
                  "Confiança não tem preço\nseu dinheiro está seguro aqui",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white),
                ),
              ),
        !vault
            ? const SizedBox()
            : const Center(
                child: Text(
                  "Entre no seu cofre",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
      ],
    );
  }
}
