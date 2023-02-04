

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/credit_card_component.dart';
import 'package:yalipay/src/views/home_view/component/movement_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

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
              
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 23
                ),
                width: double.infinity,
                
                decoration:  BoxDecoration(
                  color: colorBlackBG,
                  boxShadow: showShadowAppBar ? const [
                    BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 5
                    )
                  ] : null
                ),
                child: const Text(
                  "YaliPay",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23
                  ),
                  children: [

                    const CreditCardComponent(),

                    const SizedBox(height: 41,),

                    Row(
                      children: const [

                        Text(
                          "Movimentos ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: fontPoppinsMedium,
                            color: Colors.white
                          ),
                        ),

                        Text(
                          "Recentes",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: fontPoppinsLight
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 25,),


                    Column(
                      children: List.generate(
                        10, 
                        (index) => MovementComponent(isDebit: index.isOdd,)
                      ),
                    )
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