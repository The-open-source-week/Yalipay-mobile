import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/home_controller.dart';
import 'package:yalipay/src/models/card_model.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/views/components/credit_card_component.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/home_view/component/movement_component.dart';

class HistoricView extends StatefulWidget {
  const HistoricView({super.key});

  @override
  State<HistoricView> createState() => _HistoricViewState();
}

class _HistoricViewState extends State<HistoricView> {
  final scrollController = ScrollController();
  bool showShadowAppBar = false;

  bool isPageHome = true;

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() => showShadowAppBar = scrollController.offset > 4);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeController = context.read<HomeController>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 43,
          ),
          CustomAppBarComponent(
            showShadowAppBar: showShadowAppBar,
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 23),
              children: [
                CreditCardComponent(
                  cardData: CardModel(cardNumber: "24353453", amount: 454343),
                  color: Color(0xff4F339A),
                ),
                const SizedBox(
                  height: 41,
                ),
                Row(
                  children: const [
                    Text(
                      "Movimentos ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          fontFamily: YPUtils.fontPoppinsMedium,
                          color: Colors.white),
                    ),
                    Text(
                      "Recentes",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: YPUtils.fontPoppinsLight),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(children: [
                  if (homeController.movements.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              YPUtils.emptyMovements,
                              height: 100,
                              width: 100,
                            ),
                            const Text(
                              "Sem movimentos",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: Colors.white30,
                                  fontFamily: YPUtils.fontPoppinsLight),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ...List.generate(
                    homeController.movements.length,
                    (index) => MovementComponent(
                      isDebit: index.isOdd,
                    ),
                  )
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
