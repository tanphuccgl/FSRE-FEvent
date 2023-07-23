// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "wallet_bloc.dart";

enum TransactionType {
  deposit,
  withdraw,
  send,
  receive,
  donate,
  receviceDonate,
  cost,
  receiveCost,
  refund,
  receiveRefund;

  String get type {
    switch (this) {
      case deposit:
        return "DEPOSIT";
      case withdraw:
        return "WITHDRAW";
      case send:
        return "SEND";
      case receive:
        return "RECEIVE";
      case donate:
        return "DONATE";
      case receviceDonate:
        return "RECEIVE_DONATE";
      case cost:
        return "COST";
      case receiveCost:
        return "RECEIVE_COST";
      case refund:
        return "REFUND";
      case receiveRefund:
        return "RECEIVE_REFUND";
    }
  }
}

class WalletState extends Equatable {
  final WalletModel? walletModel;
  final TransactionModel? transactionModel;
  final double number;

  String textShow(String type) {
    switch (type) {
      case "DEPOSIT":
        return "Nạp tiền vào ví";
      case "WITHDRAW":
        return "Rút tiền từ ví";
      case "SEND":
        return "Chuyển tiền";
      case "RECEIVE":
        return "Nhận tiền";
      case "DONATE":
        return "Quyên góp";
      case "RECEIVE_DONATE":
        return "Nhận quyên góp";
      case "COST":
        return "Phí đăng ký";
      case "RECEIVE_COST":
        return "Nhận phí đăng ký";
      case "REFUND":
        return "Hoàn phí đăng ký";
      case "RECEIVE_REFUND":
        return "Nhận hoàn phí đăng ký";
      default:
        return "";
    }
  }

  const WalletState({
    this.walletModel,
    this.transactionModel,
    this.number = 0.0,
  });
  @override
  List<Object?> get props => [
        walletModel,
        transactionModel,
        number,
      ];

  WalletState copyWith({
    WalletModel? walletModel,
    TransactionModel? transactionModel,
    double? number,
  }) {
    return WalletState(
      walletModel: walletModel ?? this.walletModel,
      transactionModel: transactionModel ?? this.transactionModel,
      number: number ?? this.number,
    );
  }
}
