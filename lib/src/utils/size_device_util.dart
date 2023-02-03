import 'package:flutter/material.dart';

extension SizedDevice on BuildContext {
  Size get sizeDevice => MediaQuery.of(this).size;
}