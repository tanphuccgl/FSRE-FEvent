import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/wallet/deposit_model.dart';
import 'package:fevent/src/network/model/wallet/transaction_model.dart';
import 'package:fevent/src/network/model/wallet/wallet_model.dart';
import 'package:fevent/src/network/model/wallet/withdraw_model.dart';

abstract class WalletRepository {
  Future<XResult<WalletModel>> getWalletMe(String token);

  Future<XResult<TransactionModel>> getListTransaction(String token);

  Future<XResult<WithdrawModel>> withdraw(String token, double number);

  Future<XResult<DepositModel>> deposit(
      String token, double number, String url);
}
