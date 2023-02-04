import 'package:flutter/material.dart';
import 'package:yalipay/src/utils/consts_utils.dart';

class TextWithLinkComponent extends StatelessWidget {
  final String text;
  final String textLink;
  final MainAxisAlignment alignment;
  final Function()? onTapLink;

  const TextWithLinkComponent({
    super.key,
    required this.text,
    required this.textLink,
    required this.alignment,
    this.onTapLink
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.w500
          ),
        ),

        GestureDetector(
          onTap: onTapLink,
          child: Text(
            textLink,
            style: const TextStyle(
              fontSize: 12, 
              fontWeight: FontWeight.w500, 
              color: colorYellow
            ),
          ),
        )
      ],
    );
  }
}
