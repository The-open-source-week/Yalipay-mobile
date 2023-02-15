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
                  value: checkMain,
                  activeColor: YPUtils.colorYellow,
                  checkColor: const Color(0xff161616),
                  onChanged: (value) =>
                      setState(() => checkMain = value ?? false))
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
                value: checkCard,
                activeColor: YPUtils.colorYellow,
                checkColor: const Color(0xff161616),
                onChanged: (value) => setState(
                  () => checkCard = value ?? false,
                ),
              )
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
            onPressed: () {},
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
            onPressed: () {},
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
