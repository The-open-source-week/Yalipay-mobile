import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/main.dart';
import 'package:yalipay/src/models/transfer_money_entity.dart';
import 'package:yalipay/src/utils/alerts.dart';
import 'package:yalipay/src/utils/api_helper.dart';
import 'package:yalipay/src/utils/local_storage.dart';

class HomeController extends ChangeNotifier {
  List<dynamic> movements = [];

  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> transferMoney(BuildContext context) async {
    var result;
    try {
      var token = await YPStorage.getToken();
      var response = await APIHelper.dio.post(
        APIRoutes.transfer,
        data: TransferMoneyEntity(
                amount: amountController.text,
                phoneNumber: phoneNumberController.text)
            .toJson(),
        options: Options(
          headers: {"Authorization": "Bearer ${token.token}"},
        ),
      );
      logger.d(response.data);
    } on DioError catch (e) {
      context.showYPSnackbar(
        '${e.response!.data['error']}',
        SnackBarType.error,
      );
      logger.e(e.error);
      logger.e(e.response);
    }
    return result;
  }
}
