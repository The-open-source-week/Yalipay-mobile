import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalipay/src/controllers/cards_controller.dart';
import 'package:yalipay/src/models/card_model.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/custom_textfield_component.dart';
import 'package:yalipay/src/views/verification_pin_view/verification_pin_view.dart';

class AddCreditCardView extends StatefulWidget {
  const AddCreditCardView({super.key});

  @override
  State<AddCreditCardView> createState() => _AddCreditCardViewState();
}

class _AddCreditCardViewState extends State<AddCreditCardView> {
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
    return Consumer<CardsController>(
      builder: (context, provider, child) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: context.sizeDevice.height,
            width: context.sizeDevice.width,
            child: Column(
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
                      const Text(
                        "Add Cartão",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: YPUtils.fontPoppinsMedium),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextfieldComponent(
                        controller: provider.cardNumberController,
                        label: "Número do Cartão",
                        hint: "Insira o Número do Cartão",
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: context.sizeDevice.height / 2.2,
                      ),
                      CustomButtonCompoent(
                        title: "Confirmar",
                        onTap: () => provider.createCard(context),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Center(
                          child: Text(
                            "Cancelar Operação",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: YPUtils.fontPoppinsMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
