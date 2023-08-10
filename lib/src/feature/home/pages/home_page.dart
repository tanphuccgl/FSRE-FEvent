import 'package:fevent/src/config/constants/images.dart';
import 'package:fevent/src/feature/event/logic/events_bloc.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../logic/favoutire_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsBloc(),
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 168.h,
              backgroundColor: XColors.primary,
              flexibleSpace: SafeArea(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      children: [
                        Image.asset(XImage.location),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Địa điểm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Quận 9, TP Hồ Chí Minh",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => XCoordinator.showSearchPage(),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tìm kiếm sự kiện",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            )
                          ]),
                    ),
                  ),
                ]),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset(
                                XImage.icon1,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.countEvent,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Đang diễn ra",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.asset(
                                XImage.icon2,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.count.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "Sự kiện đã\nđăng ký",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () => XCoordinator.showAllEvent(state.list),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text("Đến trang chủ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: XColors.primary)),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (state.listUpcoming.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Sự kiện sắp tới",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                        GestureDetector(
                            onTap: () =>
                                XCoordinator.showAllEvent(state.listUpcoming),
                            child: const Text("Xem tất cả",
                                style: TextStyle(color: Colors.grey))),
                      ],
                    ),
                  ),
                if (state.listUpcoming.isNotEmpty)
                  const SizedBox(
                    height: 20,
                  ),
                if (state.listUpcoming.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 230.h,
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            _item(state.listUpcoming[index]),
                        shrinkWrap: true,
                        itemCount: state.listUpcoming.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tìm hiểu thêm",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black)),
                      GestureDetector(
                          onTap: () =>
                              XCoordinator.showAllEvent(state.listOther),
                          child: const Text("Xem tất cả",
                              style: TextStyle(color: Colors.grey))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      _itemOther(state.listOther[index]),
                  shrinkWrap: true,
                  itemCount: state.listOther.length,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _itemOther(EventModel event) {
    return BlocProvider(
      create: (context) => FavouriteBloc(event.eventId ?? ""),
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () => XCoordinator.showEventDetail(event),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(15)),
                height: 183.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              formatDateTime(event.startDate.toString()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                event.title.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            event.image ??
                                "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                            height: 110.h,
                            width: 132.w,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        SizedBox(
                          width: 200,
                          child: Text(
                            event.location.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const Spacer(),
                        state.isEnable
                            ? GestureDetector(
                                onTap: () => context
                                    .read<FavouriteBloc>()
                                    .removeFavouriteEvent(),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              )
                            : GestureDetector(
                                onTap: () => context
                                    .read<FavouriteBloc>()
                                    .postFavouriteEvent(),
                                child: const Icon(
                                  Icons.favorite_border,
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _item(EventModel event) {
    return BlocProvider(
      create: (context) => FavouriteBloc(event.eventId ?? ""),
      child: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => XCoordinator.showEventDetail(event),
            child: Container(
              height: 220.h,
              width: 300.w,
              margin: const EdgeInsets.fromLTRB(2, 0, 10, 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: Image.network(
                      event.image ??
                          "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                      //  event.image.toString(),
                      height: 139.h,
                      width: 300.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            XImage.icon3,
                            height: 50,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  event.title.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    convertUTCToLocalTime(
                                        event.startDate.toString()),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    width: 5,
                                    height: 5,
                                  ),
                                  Text(
                                    event.topic.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          state.isEnable
                              ? GestureDetector(
                                  onTap: () => context
                                      .read<FavouriteBloc>()
                                      .removeFavouriteEvent(),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => context
                                      .read<FavouriteBloc>()
                                      .postFavouriteEvent(),
                                  child: const Icon(
                                    Icons.favorite_border,
                                  ),
                                )
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String convertUTCToLocalTime(String utcTimestamp) {
    try {
      DateTime utcDateTime = DateTime.parse(utcTimestamp);
      DateTime localDateTime = utcDateTime.toLocal();
      String formattedTime =
          DateFormat('hh:mm a', "vi_VN").format(localDateTime);
      return formattedTime;
    } catch (e) {
      return "";
    }
  }

  String formatDateTime(String inputDateTime) {
    try {
      // Chuyển chuỗi input thành DateTime
      DateTime dateTime = DateTime.parse(inputDateTime);

      // Chuyển đổi sang múi giờ Việt Nam (GMT+7)
      dateTime = dateTime.toLocal();

      // Định dạng lại thành chuỗi theo yêu cầu: "WED, 12 MAY - 9:00 PM"
      String formattedDateTime =
          "${_getWeekday(dateTime)}, ${_getDay(dateTime)} ${_getMonth(dateTime)} - ${_getTime(dateTime)}";

      return formattedDateTime;
    } catch (e) {
      return "";
    }
  }

  String _getWeekday(DateTime dateTime) {
    List<String> weekdays = [
      'THỨ 2',
      'THỨ 3',
      'THỨ 4',
      'THỨ 5',
      'THỨ 6',
      'THỨ 7',
      'CN'
    ];
    return weekdays[dateTime.weekday];
  }

  String _getDay(DateTime dateTime) {
    return dateTime.day.toString().padLeft(2, '0');
  }

  String _getMonth(DateTime dateTime) {
    List<String> months = [
      'T1',
      'T2',
      'T3',
      'T4',
      'T5',
      'T6',
      'T7',
      'T8',
      'T9',
      'T10',
      'T11',
      'T12'
    ];
    return months[dateTime.month - 1];
  }

  String _getTime(DateTime dateTime) {
    String period = dateTime.hour >= 12 ? 'CH' : 'SA';
    int hour = dateTime.hour % 12;
    if (hour == 0) {
      hour = 12;
    }
    return '$hour:${dateTime.minute.toString().padLeft(2, '0')} $period';
  }
}
