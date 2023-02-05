

import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/components/credit_card_component.dart';
import 'package:yalipay/src/views/components/custom_app_component.dart';
import 'package:yalipay/src/views/home_view/component/item_menu_component.dart';
import 'package:yalipay/src/views/home_view/component/movement_component.dart';
import 'package:yalipay/src/views/transfer_view/transfer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.sizeDevice.height,
          width: context.sizeDevice.width,
          child: Column(
            children: [

              const SizedBox(height: 43,),
              
              CustomAppBarComponent(
                showShadowAppBar: showShadowAppBar,
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


      bottomNavigationBar: Container(
        height: 61.05,
        width: context.sizeDevice.width,
        color: const Color(0xff202020),
        padding: const EdgeInsets.symmetric(
          horizontal: 68,
          vertical: 20
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ItemMenuComponent(
              iconDeselected: homeWhiteIcon, 
              iconSelected: homeYellowIcon, 
              isSelected: isPageHome,
              onTap: () => setState(() => isPageHome = true),
            ),

            ItemMenuComponent(
              iconDeselected: transferWhiteIcon, 
              iconSelected: transferWhiteIcon, 
              isSelected: false,
              onTap: () => GoTo.page(context, page: const TransferView()),
            ),

            ItemMenuComponent(
              iconDeselected: folderWhiteIcon, 
              iconSelected: folderYellowIcon, 
              isSelected: !isPageHome,
              onTap: () => setState(() => isPageHome = false),
            ),

            
          ],
        ),
      ),
    );
  }
}