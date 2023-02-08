import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/utils/size_device_util.dart';
import 'package:yalipay/src/views/credit_card_view/credit_card_view.dart';
import 'package:yalipay/src/views/historic_view/historic_view.dart';
import 'package:yalipay/src/views/home_view/component/item_menu_component.dart';
import 'package:yalipay/src/views/transfer_view/transfer_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();
  final pageController = PageController();
  bool showShadowAppBar = false;

  bool isPageHome = true;

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() => showShadowAppBar = scrollController.offset > 4);
    });

    pageController.addListener(() {
      setState(() {
        isPageHome = pageController.page!.toDouble() == 0;
      });
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
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [HistoricView(), CreditCardView()],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 61.05,
        width: context.sizeDevice.width,
        color: const Color(0xff202020),
        padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemMenuComponent(
              iconDeselected: YPUtils.homeWhiteIcon,
              iconSelected: YPUtils.homeYellowIcon,
              isSelected: isPageHome,
              onTap: () => pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn),
            ),
            ItemMenuComponent(
              iconDeselected: YPUtils.transferWhiteIcon,
              iconSelected: YPUtils.transferWhiteIcon,
              isSelected: false,
              onTap: () => GoTo.page(context, page: const TransferView()),
            ),
            ItemMenuComponent(
              iconDeselected: YPUtils.folderWhiteIcon,
              iconSelected: YPUtils.folderYellowIcon,
              isSelected: !isPageHome,
              onTap: () => pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn),
            ),
          ],
        ),
      ),
    );
  }
}
