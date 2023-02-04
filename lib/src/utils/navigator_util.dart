import 'package:flutter/material.dart';

class GoTo {
  static page(BuildContext context, {dynamic page}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (contet, a,b) => page,
        transitionDuration: const Duration(milliseconds: 290),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            //scale: animation.value,
            opacity: animation,
            child: child,
          );
        }
      )
    );
  }

  static pageWithoutReturn(BuildContext context, {dynamic page}) {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (contet, a,b) => page,
        transitionDuration: const Duration(milliseconds: 290),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            //scale: animation.value,
            opacity: animation,
            child: child,
          );
        }
      ),
      (Route<dynamic> route) => false
    );
  }
}