
import 'package:flutter/material.dart';

class ItemMenuComponent extends StatelessWidget {
  final String iconSelected;
  final String iconDeselected;
  final bool isSelected;
  final Function()? onTap;

  const ItemMenuComponent({
    super.key,
    required this.iconDeselected,
    required this.iconSelected,
    required this.isSelected,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          isSelected ? iconSelected : iconDeselected,
          height: 18,
          width: 20,
        ),
      ),
    );
  }
}