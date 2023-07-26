import 'package:fevent/src/feature/event/logic/detail_event_bloc.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventDetailPage extends StatelessWidget {
  final EventModel event;
  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailEventBloc(event),
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
                    event.title.toString(),
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
                          convertUTCToFormattedDate(event.startDate.toString()),
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
                              event.startDate.toString(),
                              event.endDate.toString()),
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
                      (event.staff?.department?.name ?? "").toString(),
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
                          event.location ?? "",
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
                            event.location.toString(),
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
                  "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                  height: 168.h,
                  fit: BoxFit.cover,
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
                            Text(
                              event.title ?? "",
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
                              Icons.work,
                              color: XColors.primary,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              event.topic ?? "",
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
                              event.remainingAmount.toString(),
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
                                  event.startDate.toString(),
                                  event.endDate.toString()),
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
                              Icons.supervised_user_circle_outlined,
                              color: XColors.primary,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              event.partner?.name ?? "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
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
                    event.description ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (event.status == "PUBLIC" &&
                    (event.remainingAmount ?? 0) > 0)
                  if (state.data?.participantId == null)
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              maximumSize: const Size(150, 55)),
                          onPressed: () => XCoordinator.showEventHolder(event),
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
    DateTime utcDateTime = DateTime.parse(utcTimestamp);
    DateTime localDateTime = utcDateTime.toLocal();
    String formattedDate = DateFormat('d MMMM, yyyy').format(localDateTime);
    return formattedDate;
  }

  String convertToFormattedDateTimeRange(
      String startTimestamp, String endTimestamp) {
    DateTime startDateTime = DateTime.parse(startTimestamp).toLocal();
    DateTime endDateTime = DateTime.parse(endTimestamp).toLocal();

    String dayOfWeek = DateFormat('EEEE').format(startDateTime);
    String startTime = DateFormat('h:00 a').format(startDateTime);
    String endTime = DateFormat('h:00 a').format(endDateTime);

    return '$dayOfWeek, $startTime - $endTime';
  }
}
