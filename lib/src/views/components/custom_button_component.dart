


import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';
import 'package:yalipay/src/utils/size_device_util.dart';

class CustomButtonCompoent extends StatelessWidget {
  final String title;
  final Function? onTap;
  final bool showBorderOutline;
  const CustomButtonCompoent({super.key, required this.title, this.onTap, this.showBorderOutline = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sizeDevice.height / 13,
      width: context.sizeDevice.width,
      margin: const EdgeInsets.symmetric(horizontal: 22.5),
      decoration: BoxDecoration(
        color: showBorderOutline ? Colors.transparent : colorYellow,
        borderRadius: BorderRadius.circular(10),
        border: showBorderOutline ? Border.all(
          width: 1,
          color: colorYellow
        ) : null
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: showBorderOutline ? colorYellow : Colors.black
        ),
      ),
    );
  }
}