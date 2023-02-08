import 'package:flutter/material.dart';

extension YPContext on BuildContext {
  void showYPSnackbar(String texto, SnackBarType tipo) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 800),
          backgroundColor: tipo == SnackBarType.info
              ? Colors.yellow
              : tipo == SnackBarType.error
                  ? Colors.red
                  : Colors.green,
          content: SizedBox(
            height: 40,
            width: MediaQuery.of(this).size.width,
            child: Text(texto),
          ),
        ),
      );
}

enum SnackBarType { error, info, success }
