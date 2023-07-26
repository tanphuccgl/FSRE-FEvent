import 'package:dio/dio.dart';
import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/network/data_sources/base_data_source.dart';
import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/wallet/deposit_model.dart';
import 'package:fevent/src/network/model/wallet/transaction_model.dart';
import 'package:fevent/src/network/model/wallet/wallet_model.dart';
import 'package:fevent/src/network/model/wallet/withdraw_model.dart';
import 'package:fevent/src/network/repositories/wallet/wallet_repository.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class WalletRepositoryImpl extends WalletRepository {
  @override
  Future<XResult<WalletModel>> getWalletMe(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.wallet,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = WalletModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getWalletMe  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<TransactionModel>> getListTransaction(String token) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.transaction}?page=0&pageSize=12&orderBy=createdAt&order=ASC&isShowInactive=false",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = TransactionModel.fromJson(response.data);
      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> GET getListTransaction  CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<WithdrawModel>> withdraw(String token, double number) async {
    try {
      final response = await BaseDataSource().post(Endpoints.withdraw,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }),
          data: {"amount": number});

      final result = WithdrawModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> post withdraw A CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<DepositModel>> deposit(
      String token, double number, String url) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.deposit,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
        data: {
          "amount": number,
          "redirectUrl": url,
        },
      );

      final result = DepositModel.fromJson(response.data);

      return response.statusCode == 200 || response.statusCode == 201
          ? XResult.success(result)
          : XResult.error("Error");
    } catch (e) {
      LoggerHelper.error('> post deposit A CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
