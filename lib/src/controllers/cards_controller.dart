import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yalipay/main.dart';
import 'package:yalipay/src/models/card_model.dart';
import 'package:yalipay/src/utils/alerts.dart';
import 'package:yalipay/src/utils/api_helper.dart';
import 'package:yalipay/src/utils/local_storage.dart';
import 'package:yalipay/src/utils/navigator_util.dart';
import 'package:yalipay/src/views/credit_card_view/credit_card_view.dart';

class CardsController extends ChangeNotifier {
  TextEditingController cardNumberController = TextEditingController();
  CardModel? card;

  List<CardModel> cardsList = [];

  Future<Object> createCard(BuildContext context) async {
    var result;
    try {
      var token = await YPStorage.getToken();
      var response = await APIHelper.dio.post(APIRoutes.createCard,
          data:
              CardModel(cardNumber: cardNumberController.text).createCardBody(),
          options:
              Options(headers: {"Authorization": "Bearer ${token.token}"}));

      var card = CardModel.fromJson(response.data);
      result = card;
      cardsList.add(card);
      print(cardsList.length);
      notifyListeners();
      if (card != null) {
        // ignore: use_build_context_synchronously
        // ignore: curly_braces_in_flow_control_structures
        context.showYPSnackbar(
            'Cartão Adicionado com sucesso', SnackBarType.success);
        Navigator.pop(context);
      }
    } on DioError catch (e) {
      logger.e(e.error);
    }
    return result;
  }

  Future<void> getCards(BuildContext context) async {
    try {
      var tokenModel = await YPStorage.getToken();
      var response = await APIHelper.dio.get(
        APIRoutes.getAllCards,
        options: Options(
          headers: {'Authorization': 'Bearer ${tokenModel.token}'},
        ),
      );
      List<CardModel> _cards =
          response.data.map<CardModel>((e) => CardModel.fromJson(e)).toList();
      cardsList = _cards;
      notifyListeners();
    } on DioError catch (e) {
      logger.e(e.error);
    }
  }
}
