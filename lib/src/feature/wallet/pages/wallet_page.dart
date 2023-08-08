import 'package:fevent/src/feature/wallet/logic/wallet_bloc.dart';
import 'package:fevent/src/network/model/wallet/transaction_model.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc(),
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: XColors.primary,
                centerTitle: false,
                title: const Text(
                  "Ví của tôi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "Số dư khả dụng",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.visibility),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${state.walletModel?.balance?.toString()} VND",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderHelper.r10),
                              maximumSize: const Size(150, 40)),
                          onPressed: () => context
                              .read<WalletBloc>()
                              .onDepositButton(context),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.repeat),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Nạp tiền",
                              ),
                            ],
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderHelper.r10),
                              maximumSize: const Size(150, 40)),
                          onPressed: () => context
                              .read<WalletBloc>()
                              .onWithdrawButton(context),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.repeat),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Rút tiền",
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "Lịch sử giao dịch",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (state.transactionModel != null &&
                      (state.transactionModel?.data ?? []).isNotEmpty)
                    Expanded(
                        child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: state.transactionModel!.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _item(state.transactionModel!.data![index]);
                      },
                    ))
                ],
              ));
        },
      ),
    );
  }

  Widget _item(TransactionDataModel data) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              data.type?.contains("RECEIVE") == true
                  ? const Icon(Icons.trending_down)
                  : const Icon(Icons.trending_up),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.textShow(data.type ?? "")),
                  Text(formatDate(data.updatedAt ?? "")),
                ],
              ),
              const Spacer(),
              Text(data.type?.contains("RECEIVE") == true
                  ? "-"
                  : '+' "${data.amount}vnd"),
            ],
          ),
        );
      },
    );
  }

  String formatDate(String dateTimeString) {
    try {
      if (dateTimeString.isEmpty) return "";
      DateTime dateTime = DateTime.parse(dateTimeString);

      // Format time
      String formattedTime = DateFormat('HH:mm').format(dateTime.toLocal());

      // Format date
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(DateTime(2023, 3, 21));

      return '$formattedTime - $formattedDate';
    } catch (e) {
      return "";
    }
  }
}
