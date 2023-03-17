import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/cards_controller.dart';
import 'package:yalipay/src/models/card_model.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/views/add_credit_card_view/add_credit_card_view.dart';
import 'package:yalipay/src/views/components/credit_card_component.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/credit_card_view/alerts/alert_options.dart';

class CreditCardView extends StatefulWidget {
  const CreditCardView({super.key});

  @override
  State<CreditCardView> createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  final scrollController = ScrollController();
  bool showShadowAppBar = false;

  @override
  void initState() {
    context.read<CardsController>().getCards(context);
    scrollController.addListener(() {
      setState(() => showShadowAppBar = scrollController.offset > 4);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 43,
          ),
          CustomAppBarComponent(showShadowAppBar: showShadowAppBar),
          Consumer<CardsController>(
            builder: (context, provider, child) => Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 23),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cartões",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: YPUtils.fontPoppinsMedium),
                      ),
                      GestureDetector(
                        onTap: () =>
                            GoTo.page(context, page: const AddCreditCardView()),
                        child: Image.asset(
                          YPUtils.addWhiteIcon,
                          width: 20,
                          height: 23.53,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    child: provider.cardsList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  size: 50,
                                  color: Colors.amber.withOpacity(0.4),
                                ),
                                const Text(
                                  "Lista Vazia",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white24,
                                  ),
                                )
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: provider.cardsList.length,
                            itemBuilder: (context, index) =>
                                CreditCardComponent(
                              enable: provider.cardsList[index].isActive!,
                              cardData: CardModel(
                                  cardNumber:
                                      provider.cardsList[index].cardNumber,
                                  amount: provider.cardsList[index].amount),
                              showOptions: true,
                              margin: const EdgeInsets.only(bottom: 15),
                              color: provider.cardsList[index].isActive!
                                  ? Color(0xff4F339A)
                                  : Color(0xff4F339A).withOpacity(0.1),
                              onTapOptionBtn: () => showDialog(
                                  context: context,
                                  builder: (ctx) => Dialog(
                                        child: AlertOptions(
                                          cardData: provider.cardsList[index],
                                        ),
                                      )),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
