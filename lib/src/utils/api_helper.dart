import 'package:dio/dio.dart';

abstract class APIRoutes {
  // Authentication
  static const String login = 'auth/login';
  static const String register = 'user/create';

  // Cards

  static const String createCard = 'card/create';
  static const String getAllCards = 'cards';
  static const String ativateMainCard = "card/update/";
  static const String activateCard = "card/active/";
  static const String deactivateCard = "card/desactive/";
  static const String deleteCard = "card/remove/";

  // Transfer

  static const String transfer = 'transfer';
}

class APIHelper {
  //TODO: Change this to your own API
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000/api/v1/',
      contentType: 'application/json',
    ),
  );
}
