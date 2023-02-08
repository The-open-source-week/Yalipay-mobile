class TokenModel {
  String? token;

  TokenModel({this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      TokenModel(token: json['token']);
}
