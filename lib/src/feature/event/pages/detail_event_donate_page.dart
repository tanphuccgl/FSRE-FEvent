import 'package:fevent/src/feature/event/logic/detail_event_bloc.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DetailEventDonatePage extends StatelessWidget {
  final String eventId;
  const DetailEventDonatePage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailEventBloc(eventId),
      child: BlocBuilder<DetailEventBloc, DetailEventState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: XColors.primary,
              centerTitle: false,
              title: const Text(
                "Chi tiết sự kiện",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    (state.eventModel?.title ?? "").toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    const Icon(
                      Icons.calendar_today_rounded,
                      color: XColors.primary,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          convertUTCToFormattedDate(
                              (state.eventModel?.startDate ?? "").toString()),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          convertToFormattedDateTimeRange(
                              (state.eventModel?.startDate ?? "").toString(),
                              (state.eventModel?.endDate ?? "").toString()),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    const Icon(
                      Icons.location_city,
                      color: XColors.primary,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        (state.eventModel?.staff?.department?.name ?? "")
                            .toString(),
                        maxLines: 3,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    const Icon(
                      Icons.location_on_outlined,
                      color: XColors.primary,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            state.eventModel?.location ?? "",
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            (state.eventModel?.location ?? "").toString(),
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Donated",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: (state.eventModel?.totalDonation ?? 0)
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            const TextSpan(
                              text: "/5.000.000",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "VND",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 300,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: (state.eventModel?.totalDonation ?? 0) / 5000000,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            XColors.primary),
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Donations\n',
                              style: TextStyle(
                                  color: XColors.text,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: (state.eventModel?.donations ?? [])
                                  .length
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Time remaining\n',
                              style: TextStyle(
                                  color: XColors.text,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text:
                                  "${calculateTimeDifference(state.eventModel?.startDate ?? "")} Days",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                  "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                  height: 168.h,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if ((state.eventModel?.status == "PUBLIC" ||
                            state.eventModel?.status == "UPCOMING") &&
                        (state.eventModel?.remainingAmount ?? 0) > 0)
                      if (state.data?.participantId == null)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(150, 55)),
                            onPressed: () => XCoordinator.showEventOne(eventId),
                            child: const Text(
                              "Đăng ký",
                            ))
                      else
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                maximumSize: const Size(150, 55)),
                            onPressed: () => context
                                .read<DetailEventBloc>()
                                .onRemoveRegisterEventButton(context),
                            child: const Text(
                              "Hủy Đăng ký",
                            )),
                    if (state.eventModel?.status == "PUBLIC" ||
                        state.eventModel?.status == "UPCOMING")
                      if ((state.eventModel?.donations ?? []).isNotEmpty)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreen,
                                maximumSize: const Size(150, 55)),
                            onPressed: () =>
                                XCoordinator.showEventDonate(eventId),
                            child: const Text(
                              "Quyên góp",
                            )),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String calculateTimeDifference(String a) {
    try {
      DateTime targetTime = DateTime.parse(a);
      DateTime currentTime = DateTime.now();
      Duration difference = currentTime.difference(targetTime);
      int daysDifference = difference.inDays;
      return daysDifference.abs().toString();
    } catch (e) {
      return "";
    }
  }

  String convertUTCToFormattedDate(String utcTimestamp) {
    try {
      DateTime utcDateTime = DateTime.parse(utcTimestamp);
      DateTime localDateTime = utcDateTime.toLocal();
      String formattedDate =
          DateFormat('d MMMM, yyyy', "vi_VN").format(localDateTime);
      return formattedDate;
    } catch (e) {
      return "";
    }
  }

  String convertToFormattedDateTimeRange(
      String startTimestamp, String endTimestamp) {
    try {
      DateTime startDateTime = DateTime.parse(startTimestamp).toLocal();
      DateTime endDateTime = DateTime.parse(endTimestamp).toLocal();

      String dayOfWeek = DateFormat('EEEE', "vi_VN").format(startDateTime);
      String startTime = DateFormat('h:00 a', "vi_VN").format(startDateTime);
      String endTime = DateFormat('h:00 a', "vi_VN").format(endDateTime);

      return '$dayOfWeek, $startTime - $endTime';
    } catch (e) {
      return "";
    }
  }
}
