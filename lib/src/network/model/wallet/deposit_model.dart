class DepositModel {
  String? key;
  String? paymentUrl;

  DepositModel({this.key, this.paymentUrl});

  DepositModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['paymentUrl'] = paymentUrl;
    return data;
  }
}
