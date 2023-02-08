import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';

class MovementComponent extends StatelessWidget {
  final bool isDebit;
  const MovementComponent({super.key, required this.isDebit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: const Color(0xff161616),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        children: [
          Image.asset(
            YPUtils.avatarImage,
            height: 41,
            width: 41,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Avatar Name User",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 14),
              ),
              Text(
                "Transferência ",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff858585),
                    fontSize: 10),
              )
            ],
          ),
          const Spacer(),
          Icon(
            isDebit ? CupertinoIcons.arrow_down : CupertinoIcons.arrow_up,
            color: isDebit ? Colors.red : Colors.green,
            size: 10,
          ),
          const Text(
            "AOA 2,000.00",
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
