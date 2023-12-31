import 'package:fevent/src/feature/event/logic/detail_event_bloc.dart';

import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventDetailPage extends StatelessWidget {
  final String eventId;
  const EventDetailPage({super.key, required this.eventId});

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
                    state.eventModel?.title ?? "",
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
                              state.eventModel?.startDate ?? ""),
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
                            state.eventModel?.startDate ?? "",
                            state.eventModel?.endDate ?? "",
                          ),
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
                    Text(
                      (state.eventModel?.staff?.department?.name ?? "")
                          .toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
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
                        Text(
                          state.eventModel?.location ?? "",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            state.eventModel?.location ?? "",
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
                  height: 15,
                ),
                Image.network(
                  state.eventModel?.image ??
                      "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                  height: 168.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: XColors.primary)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: XColors.primary,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                state.eventModel?.title ?? "",
                                maxLines: 3,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.work,
                              color: XColors.primary,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              state.eventModel?.topic ?? "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person_3,
                              color: XColors.primary,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              (state.eventModel?.remainingAmount).toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.timelapse_sharp,
                              color: XColors.primary,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              convertToFormattedDateTimeRange(
                                  state.eventModel?.startDate ?? "",
                                  state.eventModel?.endDate ?? ""),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if ((state.eventModel?.partners ?? []).isNotEmpty)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.supervised_user_circle_outlined,
                                color: XColors.primary,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.eventModel!.partners!.map((e) {
                                  return SizedBox(
                                    width: 250,
                                    child: Text(e.name ?? "",
                                        maxLines: 3,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Thông tin sự kiện",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    state.eventModel?.description ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if ((state.eventModel?.status == "PUBLIC" ||
                        state.eventModel?.status == "UPCOMING") &&
                    (state.eventModel?.remainingAmount ?? 0) > 0)
                  if (state.data?.participantId == null)
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              maximumSize: const Size(150, 55)),
                          onPressed: () =>
                              XCoordinator.showEventHolder(eventId),
                          child: const Text(
                            "Đăng ký",
                          )),
                    )
                  else
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              maximumSize: const Size(150, 55)),
                          onPressed: () => context
                              .read<DetailEventBloc>()
                              .onRemoveRegisterEventButton(context),
                          child: const Text(
                            "Hủy Đăng ký",
                          )),
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
