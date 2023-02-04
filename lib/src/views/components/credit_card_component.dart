
import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';

class CreditCardComponent extends StatefulWidget {
  const CreditCardComponent({super.key});

  @override
  State<CreditCardComponent> createState() => _CreditCardComponentState();
}

class _CreditCardComponentState extends State<CreditCardComponent> {

  bool enable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: context.sizeDevice.width,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 13
      ),
      decoration: BoxDecoration(
        color: const Color(0xff4F339A),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Saldo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: fontInter
                ),
              ),

              GestureDetector(
                onTap: () => setState(() => enable = !enable),
                child: Container(
                  width: 30,
                  height: 15,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: AnimatedAlign(
                    alignment: enable ? Alignment.centerLeft : Alignment.centerRight, 
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Color(0xff4F339A),
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),


          const SizedBox(height: 10),


          Row(
            children: const [
              Text(
                "AOA ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: fontInter
                ),
              ),


              Text(
                "2,534,768.00",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 23,
                  fontFamily: fontInter
                ),
              )
            ],
          ),

          const Spacer(),

          const Text(
            "Número do Cartão",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12
            ),
          ),

          const SizedBox(height: 7,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text(
                "1234 4567 6553 1389",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontInter,
                  fontWeight: FontWeight.w600,
                  fontSize: 10
                ),
              ),

              Image.asset(
                visaIcon,
                height: 12,
                width: 38,
              )
            ],
          )
        ],
      ),
    );
  }
}