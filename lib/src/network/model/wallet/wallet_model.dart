class WalletModel {
  String? walletId;
  String? balance;
  String? createdAt;
  String? updatedAt;

  WalletModel({this.walletId, this.balance, this.createdAt, this.updatedAt});

  WalletModel.fromJson(Map<String, dynamic> json) {
    walletId = json['walletId'];
    balance = json['balance'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['walletId'] = walletId;
    data['balance'] = balance;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
