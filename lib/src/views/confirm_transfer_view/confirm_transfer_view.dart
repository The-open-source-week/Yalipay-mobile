import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/home_view/home_view.dart';

class ConfirmTransferView extends StatefulWidget {
  const ConfirmTransferView({super.key});

  @override
  State<ConfirmTransferView> createState() => _ConfirmTransferViewState();
}

class _ConfirmTransferViewState extends State<ConfirmTransferView> {
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
              const CustomAppBarComponent(showShadowAppBar: false),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      YPUtils.cloudCheckImage,
                      height: 72.73,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sua transferência foi realizada\ncom sucesso",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 84,
                    ),
                    GestureDetector(
                      onTap: () => GoTo.pageWithoutReturn(context,
                          page: const HomeView()),
                      child: const Text(
                        "Voltar ao Inicio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: YPUtils.colorYellow),
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
