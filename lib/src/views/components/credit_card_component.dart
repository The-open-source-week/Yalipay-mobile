import 'package:flutter/material.dart';
import 'package:yalipay/src/models/card_model.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';

class CreditCardComponent extends StatefulWidget {
  final EdgeInsets? margin;
  final Color color;
  final bool showOptions;
  final CardModel cardData;
  final void Function()? onTapOptionBtn;
  const CreditCardComponent(
      {super.key,
      this.margin,
      required this.cardData,
      required this.color,
      this.showOptions = false,
      this.onTapOptionBtn});

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
      margin: widget.margin,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
      decoration: BoxDecoration(
          color: enable ? widget.color : widget.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saldo",
                style: TextStyle(
                    color:
                        enable ? Colors.white : Colors.white.withOpacity(0.2),
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                    fontFamily: YPUtils.fontInterBold),
              ),
              widget.showOptions
                  ? GestureDetector(
                      onTap: widget.onTapOptionBtn,
                      child: Image.asset(
                        YPUtils.optionWhiteIcon,
                        height: 20,
                        width: 20,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => setState(() => enable = !enable),
                      child: Container(
                        width: 30,
                        height: 15,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: enable
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(30)),
                        child: AnimatedAlign(
                          alignment: enable
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          duration: const Duration(milliseconds: 250),
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                                color: Color(0xff4F339A),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "AOA ",
                style: TextStyle(
                    color:
                        enable ? Colors.white : Colors.white.withOpacity(0.2),
                    fontWeight: FontWeight.w100,
                    fontSize: 23,
                    fontFamily: YPUtils.fontInterBold),
              ),
              Text(
                "${widget.cardData.amount ?? "0"}",
                style: TextStyle(
                    color:
                        enable ? Colors.white : Colors.white.withOpacity(0.2),
                    fontSize: 23,
                    fontFamily: YPUtils.fontInterLight),
              )
            ],
          ),
          const Spacer(),
          Text(
            "Número do Cartão",
            style: TextStyle(
                color: enable ? Colors.white : Colors.white.withOpacity(0.2),
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.cardData.cardNumber ?? "00"}",
                style: TextStyle(
                    color:
                        enable ? Colors.white : Colors.white.withOpacity(0.2),
                    fontFamily: YPUtils.fontInter,
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
              Opacity(
                opacity: enable ? 1 : 0.2,
                child: Image.asset(
                  YPUtils.visaIcon,
                  height: 12,
                  width: 38,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
