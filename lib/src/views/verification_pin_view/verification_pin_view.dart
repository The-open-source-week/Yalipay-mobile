import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/text_with_link_component.dart';
import 'package:yalipay/src/views/confirm_transfer_view/confirm_transfer_view.dart';
import 'package:yalipay/src/views/verification_pin_view/components/pin_component.dart';

class VerificationPinView extends StatefulWidget {
  const VerificationPinView({super.key});

  @override
  State<VerificationPinView> createState() => _VerificationPinViewState();
}

class _VerificationPinViewState extends State<VerificationPinView> {
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
                      "Validar Operação",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: YPUtils.fontPoppinsMedium),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Para validar a transferência, no valor de AOA 79,45, insira o código de confirmação que recebeu por SMS.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PinComponent(
                      onFinished: (result) {
                        debugPrint(result);
                      },
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    const TextWithLinkComponent(
                        text: "Não recebi o código de confirmação, ",
                        textLink: "Reenviar",
                        alignment: MainAxisAlignment.start),
                    SizedBox(
                      height: context.sizeDevice.height / 3.5,
                    ),
                    CustomButtonCompoent(
                      title: "Transferir",
                      onTap: () =>
                          GoTo.page(context, page: const ConfirmTransferView()),
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
                              fontFamily: YPUtils.fontPoppinsMedium),
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
    );
  }
}
