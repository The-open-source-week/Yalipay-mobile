class CardModel {
  String? id;
  String? cardNumber;
  int? cvv;
  int? amount;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? expireAt;
  String? accountId;
  bool? isMain;

  CardModel({
    this.id,
    this.cardNumber,
    this.cvv,
    this.amount,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.expireAt,
    this.accountId,
    this.isMain,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json['id'],
        cvv: json['cvv'],
        cardNumber: json['cardNumber'],
        createdAt: json['createdAt'],
        amount: json['amount'],
        isActive: json['isActive'],
        updatedAt: json['updatedAt'],
        accountId: json['accountId'],
        isMain: json['isMain'],
      );

  Map<String, dynamic> createCardBody() => {"cardNumber": cardNumber};
}
