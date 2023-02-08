import 'package:dio/dio.dart';

abstract class APIRoutes {
  static const String login = 'auth/login';
  static const String register = 'user/create';
}

class APIHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000/api/v1/',
      contentType: 'application/json',
    ),
  );
}
