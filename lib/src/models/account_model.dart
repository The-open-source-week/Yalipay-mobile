class AccountModel {
  String? id;
  String? username;
  String? email;
  DateTime? verifiredAt;
  String? password;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? code;
  int? accountNumber;

  AccountModel(
      {this.accountNumber,
      this.phoneNumber,
      this.code,
      this.createdAt,
      this.email,
      this.password,
      this.id,
      this.updatedAt,
      this.username,
      this.verifiredAt});

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        verifiredAt: DateTime.parse(json["verifiredAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        code: json["code"],
        accountNumber: int.parse(json["accountNumber"]),
      );

  factory AccountModel.dadosBancarios(Map<String, dynamic> json) =>
      AccountModel(
          username: json['username'],
          code: json['code'],
          accountNumber: json['accountNumber']);

  Map<String, dynamic> loginBody() => {'email': email, 'password': password};

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "verifiredAt": verifiredAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "code": code,
        "accountNumber": accountNumber,
      };
}
