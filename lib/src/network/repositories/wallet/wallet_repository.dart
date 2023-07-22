import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/wallet/deposit_model.dart';
import 'package:fevent/src/network/model/wallet/transaction_model.dart';
import 'package:fevent/src/network/model/wallet/wallet_model.dart';

abstract class WalletRepository {
  Future<XResult<WalletModel>> getWalletMe();

  Future<XResult<TransactionModel>> getListTransaction();

  Future<XResult<TransactionModel>> withdraw(double number);

  Future<XResult<DepositModel>> deposit(double number, String url);
}
