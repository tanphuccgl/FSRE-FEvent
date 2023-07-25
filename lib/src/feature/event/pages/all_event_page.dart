import 'package:fevent/src/feature/event/logic/events_bloc.dart';
import 'package:fevent/src/feature/home/logic/favoutire_bloc.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AllEventPage extends StatelessWidget {
  const AllEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsBloc(),
      child: BlocBuilder<EventsBloc, EventsState>(
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
                      "Tất cả sự kiện",
                      style: TextStyle(
                          color: XColors.primary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.more_vert)
                  ]),
                ),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              shrinkWrap: true,
              itemBuilder: (context, index) => _item(state.list[index]),
              itemCount: state.list.length,
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
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () => XCoordinator.showEventDetail(event),
              child: SizedBox(
                height: 148.h,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                        height: 148.h,
                        width: 118.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          convertUTCToFormattedDateTime(
                              event.createdAt.toString()),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
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
                        SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on_outlined),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  event.location.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const Spacer(),
                              state.isEnable
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String convertUTCToFormattedDateTime(String utcTimestamp) {
    DateTime utcDateTime = DateTime.parse(utcTimestamp);
    DateTime localDateTime = utcDateTime.toLocal();
    String formattedDateTime =
        DateFormat('d MMM, yyyy, h:mm a').format(localDateTime);
    return formattedDateTime;
  }
}
