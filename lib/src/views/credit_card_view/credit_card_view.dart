import 'package:flutter/material.dart';
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
          Expanded(
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
                  Column(
                    children: List.generate(
                      3,
                      (index) => CreditCardComponent(
                        showOptions: true,
                        margin: const EdgeInsets.only(bottom: 15),
                        color: index == 1
                            ? const Color(0xffED1E79)
                            : const Color(0xff4F339A),
                        onTapOptionBtn: () => showDialog(
                            context: context,
                            builder: (ctx) => const Dialog(
                                  child: AlertOptions(),
                                )),
                      ),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
