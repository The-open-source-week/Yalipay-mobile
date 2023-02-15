import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/local_storage.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/views/login_view/login_view.dart';

class CustomAppBarComponent extends StatelessWidget {
  final bool showShadowAppBar;
  const CustomAppBarComponent({super.key, required this.showShadowAppBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      width: double.infinity,
      decoration: BoxDecoration(
          color: YPUtils.colorBlackBG,
          boxShadow: showShadowAppBar
              ? const [
                  BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 5)
                ]
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "YaliPay",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          IconButton(
              onPressed: () {
                YPStorage.clear();
                GoTo.pageWithoutReturn(context, page: const LoginView());
              },
              icon: const Icon(
                Icons.logout_sharp,
                color: Colors.white54,
                size: 22,
              ))
        ],
      ),
    );
  }
}
