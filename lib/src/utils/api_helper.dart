import 'package:dio/dio.dart';

abstract class APIRoutes {
  // Authentication
  static const String login = 'auth/login';
  static const String register = 'user/create';

  // Cards

  static const String createCard = 'card/create';
  static const String getAllCards = 'cards';
}

class APIHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000/api/v1/',
      contentType: 'application/json',
    ),
  );
}
