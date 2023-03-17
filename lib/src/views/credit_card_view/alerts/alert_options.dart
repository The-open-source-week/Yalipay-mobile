import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/cards_controller.dart';
import 'package:yalipay/src/models/card_model.dart';
import 'package:yalipay/src/utils/consts_utils.dart';

class AlertOptions extends StatefulWidget {
  const AlertOptions({super.key, this.cardData});
  final CardModel? cardData;

  @override
  State<AlertOptions> createState() => _AlertOptionsState();
}

class _AlertOptionsState extends State<AlertOptions> {
  bool? isMainState, isActiveState = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
          color: const Color(0xff161616),
          borderRadius: BorderRadius.circular(6)),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "O que Deseja fazer?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            )
          ]),
          const SizedBox(
            height: 51,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Definir como Principal",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
              ),
              const SizedBox(
                width: 5,
              ),
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  value: widget.cardData?.isMain ?? false,
                  activeColor: YPUtils.colorYellow,
                  checkColor: const Color(0xff161616),
                  onChanged: (value) {
                    switch (value) {
                      case true:
                        setState(() {
                          isMainState = value;
                          widget.cardData!.isMain = value;
                        });
                        break;
                      case false:
                        setState(() {
                          isMainState = value;
                          widget.cardData!.isMain = value;
                        });
                        break;
                    }
                  }),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Habilitar Cartão",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
              ),
              const SizedBox(
                width: 5,
              ),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                value: widget.cardData?.isActive ?? false,
                activeColor: YPUtils.colorYellow,
                checkColor: const Color(0xff161616),
                onChanged: (value) {
                  switch (value) {
                    case true:
                      setState(() {
                        isActiveState = value;
                        widget.cardData!.isActive = value;
                      });
                      break;
                    case false:
                      setState(() {
                        isActiveState = value;
                        widget.cardData!.isActive = value;
                      });
                      break;
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4F339A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            onPressed: () {
              isActiveState!
                  ? context
                      .read<CardsController>()
                      .activateCard(context, widget.cardData!)
                  : context
                      .read<CardsController>()
                      .deactivateCard(context, widget.cardData!);
              context
                  .read<CardsController>()
                  .activateMainCard(context, widget.cardData!, isActiveState!);
            },
            child: const Text(
              "Salvar",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.white),
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xff4F339A)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {
              context
                  .read<CardsController>()
                  .deleteCard(context, widget.cardData!);
            },
            child: const Text(
              "Remover Cartão",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
