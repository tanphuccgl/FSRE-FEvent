// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:fevent/src/network/domain.dart';
import 'package:fevent/src/network/model/wallet/transaction_model.dart';
import 'package:fevent/src/network/model/wallet/wallet_model.dart';
import 'package:fevent/src/services/user_prefs.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:fevent/src/widgets/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "wallet_state.dart";

class WalletBloc extends Cubit<WalletState> {
  WalletBloc() : super(const WalletState()) {
    getWalletMe();
    getListTransaction();
  }
  Domain get _domain => GetIt.I<Domain>();

  Future<void> getWalletMe() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.walletRepository.getWalletMe(token);
    if (result.isSuccess) {
      emit(state.copyWith(walletModel: result.data));
    }
  }

  Future<void> getListTransaction() async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;
    final result = await _domain.walletRepository.getListTransaction(token);
    if (result.isSuccess) {
      emit(state.copyWith(transactionModel: result.data));
    }
  }

  Future<void> withdraw(BuildContext context) async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    if (state.number < 50000) {
      XToast.error("Lỗi");
      return;
    }

    final result = await _domain.walletRepository.withdraw(token, state.number);
    if (result.isSuccess) {
      //  emit(state.copyWith(walletModel: result.data));
      getWalletMe();
      Navigator.pop(context);
    } else {
      XToast.error("Lỗi");
    }
    onChangedNumber("0");
  }

  Future<void> deposit(BuildContext context) async {
    final token = UserPrefs().getTokenUser;
    if (token == null) return;

    if (state.number < 50000) {
      XToast.error("Lỗi");
      return;
    }

    final result = await _domain.walletRepository
        .deposit(token, state.number, "https://www.facebook.com/");
    if (result.isSuccess) {
      //  emit(state.copyWith(walletModel: result.data));
      getWalletMe();
      Navigator.pop(context);
    } else {
      XToast.error("Lỗi");
    }
    onChangedNumber("0");
  }

  void onChangedNumber(String number) {
    emit(state.copyWith(number: double.tryParse(number)));
  }

  void onWithdrawButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context1) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 22,
                  width: 88,
                  color: XColors.containerDialogWallet,
                  child: const Center(
                    child: Text(
                      'SỐ TIỀN:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                XInput(
                  value: state.number == 0.0 ? "" : state.number.toString(),
                  filled: true,
                  onChanged: (value) => onChangedNumber(value),
                  keyboardType: TextInputType.number,
                  fillColor: XColors.containerDialogWallet,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: XColors.bgGrey, width: 1),
                    borderRadius: BorderHelper.r10,
                  ),
                ),
                const Text(
                  '*Số tiền nạp tối thiểu là 50.000vnd.\n\n'
                  'Vui lòng chờ 24h để tiền được nhập vào tài khoản.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.r10),
                      maximumSize: const Size(250, 40)),
                  onPressed: () => withdraw(context1),
                  child: const Text(
                    "NẠP TIỀN",
                  )),
            ),
          ],
        );
      },
    );
  }

  void onDepositButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context1) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 22,
                  width: 88,
                  color: XColors.containerDialogWallet,
                  child: const Center(
                    child: Text(
                      'SỐ TIỀN:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                XInput(
                  value: state.number == 0.0 ? "" : state.number.toString(),
                  filled: true,
                  onChanged: (value) => onChangedNumber(value),
                  keyboardType: TextInputType.number,
                  fillColor: XColors.containerDialogWallet,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: XColors.bgGrey, width: 1),
                    borderRadius: BorderHelper.r10,
                  ),
                ),
                const Text(
                  '*Số tiền rút tối thiểu là 50.000vnd.\n\n'
                  'Vui lòng chờ 24h để tiền được nhập vào tài khoản.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderHelper.r10),
                      maximumSize: const Size(250, 40)),
                  onPressed: () => deposit(context1),
                  child: const Text(
                    "RÚT TIỀN",
                  )),
            ),
          ],
        );
      },
    );
  }
}
