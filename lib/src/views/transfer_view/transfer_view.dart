import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/components/custom_button_component.dart';
import 'package:yalipay/src/views/components/custom_textfield_component.dart';

class TransferView extends StatefulWidget {
  const TransferView({super.key});

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {

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

              const SizedBox(height: 43,),

              CustomAppBarComponent(
                showShadowAppBar: showShadowAppBar
              ),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23
                  ),

                  children: [

                    const SizedBox(height: 20,),

                    const Text(
                      "Transferir",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: fontPoppinsMedium
                      ),
                    ),

                    const SizedBox(height: 20,),

                    const CustomTextfieldComponent(
                      label: "IBAN", 
                      hint: "Insira o iban",
                      textInputType: TextInputType.number,
                    ),

                    const SizedBox(height: 30,),

                    const CustomTextfieldComponent(
                      label: "Montante", 
                      hint: "Insira o montante",
                      textInputType: TextInputType.number,
                    ),

                    SizedBox(height: context.sizeDevice.height / 3.2,),

                    const CustomButtonCompoent(title: "Transferir"),


                    const SizedBox(height: 17,),

                    const Center(
                      child: Text(
                        "Cancelar Operação",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: fontPoppinsMedium
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