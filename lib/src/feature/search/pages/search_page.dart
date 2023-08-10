import 'package:fevent/src/feature/home/logic/favoutire_bloc.dart';
import 'package:fevent/src/feature/search/logic/search_bloc.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 168.h,
              backgroundColor: XColors.primary,
              flexibleSpace: SafeArea(
                child: Column(children: [
                  const Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: BackButton(
                            color: Colors.white,
                          ))),
                  GestureDetector(
                    onTap: () =>
                        context.read<SearchBloc>().showDialogFilter(context),
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
            body: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Kết quả",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) =>
                        _itemOther(state.list[index]),
                    shrinkWrap: true,
                    itemCount: state.list.length,
                  ),
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
              onTap: () {},
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
                              formatDateTime(event.createdAt.toString()),
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
                            "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                            height: 110.h,
                            width: 132.w,
                            fit: BoxFit.cover,
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
    List<String> weekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return weekdays[dateTime.weekday];
  }

  String _getDay(DateTime dateTime) {
    return dateTime.day.toString().padLeft(2, '0');
  }

  String _getMonth(DateTime dateTime) {
    List<String> months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return months[dateTime.month - 1];
  }

  String _getTime(DateTime dateTime) {
    String period = dateTime.hour >= 12 ? 'PM' : 'AM';
    int hour = dateTime.hour % 12;
    if (hour == 0) {
      hour = 12;
    }
    return '$hour:${dateTime.minute.toString().padLeft(2, '0')} $period';
  }
}
