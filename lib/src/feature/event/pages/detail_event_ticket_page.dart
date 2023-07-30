import 'package:fevent/src/feature/event/logic/detail_event_bloc.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DetailEventTicketPage extends StatelessWidget {
  final EventModel event;
  const DetailEventTicketPage({super.key, required this.event});

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
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    const Icon(
                      Icons.card_membership,
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
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Giá tiền: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: "100.000đ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Số lượng: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text: "01 Vé",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
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
                const SizedBox(
                  height: 15,
                ),
                if (event.status == "PUBLIC" &&
                    (event.remainingAmount ?? 0) > 0)
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(150, 55)),
                        onPressed: () => XCoordinator.showEventTicketSuccess(),
                        child: const Text(
                          "Mua vé",
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
