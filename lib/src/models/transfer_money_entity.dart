class TransferMoneyEntity {
  String? amount;
  String? phoneNumber;

  TransferMoneyEntity({this.amount, this.phoneNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
