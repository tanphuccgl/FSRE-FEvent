class TransactionModel {
  List<TransactionDataModel>? data;
  int? count;

  TransactionModel({this.data, this.count});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransactionDataModel>[];
      json['data'].forEach((v) {
        data!.add(TransactionDataModel.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class TransactionDataModel {
  String? transactionId;
  String? amount;
  String? beforeBalance;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;

  TransactionDataModel(
      {this.transactionId,
      this.amount,
      this.beforeBalance,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});

  TransactionDataModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    amount = json['amount'];
    beforeBalance = json['beforeBalance'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['amount'] = amount;
    data['beforeBalance'] = beforeBalance;
    data['type'] = type;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
