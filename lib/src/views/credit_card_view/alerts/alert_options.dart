
import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';

class AlertOptions extends StatefulWidget {
  const AlertOptions({super.key});

  @override
  State<AlertOptions> createState() => _AlertOptionsState();
}

class _AlertOptionsState extends State<AlertOptions> {

  bool checkMain = false;
  bool checkCard = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 354,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 13
      ),
      decoration: BoxDecoration(
        color: const Color(0xff161616),
        borderRadius: BorderRadius.circular(6)
      ),
      child: Column(
        children: [

          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 20,
                width: 20,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2)
                ),
                alignment: Alignment.center,
                child: const  Text(
                  "X",
                  style: TextStyle(
                    color:Color(0xff161616) 
                  ),
                ),
              ),
            ),
          ),

          const Text(
            "O que Deseja fazer?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          ),

          const SizedBox(height: 51,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Definir como Principal",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10
                ),
              ),

              const SizedBox(width: 5,),

              Checkbox(
                value: checkMain, 
                activeColor: colorYellow,
                checkColor: const Color(0xff161616),
                onChanged: (value) => setState(() => checkMain = value ?? false)
              )
            ],
          ),

          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Habilitar Cartão",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10
                ),
              ),

              const SizedBox(width: 5,),

              Checkbox(
                value: checkMain, 
                activeColor: colorYellow,
                checkColor: const Color(0xff161616),
                onChanged: (value) => setState(() => checkMain = value ?? false)
              )
            ],
          ),

          const SizedBox(height: 20,),

          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 124,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xffED1C24),
                borderRadius: BorderRadius.circular(6)
              ),
              alignment: Alignment.center,
              child: const Text(
                "Remover Cartão",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}