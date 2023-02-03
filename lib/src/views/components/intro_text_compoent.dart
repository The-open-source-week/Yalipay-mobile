
import 'package:flutter/material.dart';

class IntroTextComponent extends StatelessWidget {
  const IntroTextComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
            child: Text(
              "YaliPay",     
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 48,
                color: Colors.white
              ),
            ),
          ),

          Center(
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
      ],
    );
  }
}