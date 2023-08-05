import 'package:fevent/src/feature/my_donation/logic/donation_me_bloc.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../network/model/my_donation.dart';

class MyDonationPage extends StatelessWidget {
  const MyDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyDonationBloc(),
      child: BlocBuilder<MyDonationBloc, MyDonationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: XColors.primary, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Lịch sử quyên góp",
                      style: TextStyle(
                          color: XColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert)
                  ]),
                ),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  _item((state.donationModel?.data ?? [])[index]),
              itemCount: (state.donationModel?.data ?? []).length,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Text(
                "Tổng số tiền: ${state.total}đ",
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _item(Data event) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 62.h,
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: XColors.primary,
                ),
                child: const Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                  size: 20,
                )),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  event.note.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  convertDateTimeToFormattedString(event.createdAt.toString()),
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "- ${event.amount ?? 0}đ",
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  String convertDateTimeToFormattedString(String input) {
    try {
      final DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ");
      final DateFormat outputDateFormat = DateFormat("dd/MM/yyyy");
      final DateFormat outputTimeFormat = DateFormat.Hm();

      DateTime dateTime = inputFormat.parse(input);
      String formattedTime = outputTimeFormat.format(dateTime);
      String formattedDate = outputDateFormat.format(dateTime);

      return '$formattedTime - $formattedDate';
    } catch (e) {
      return "";
    }
  }
}
