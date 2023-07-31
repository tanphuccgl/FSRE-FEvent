import 'package:fevent/src/feature/my_event/logic/my_events_bloc.dart';

import 'package:fevent/src/network/model/participants_by_event_status_model.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DoingTab extends StatelessWidget {
  const DoingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyEventsBloc, MyEventsState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          shrinkWrap: true,
          itemCount: (state.participantsByEventStatusUpcomming
                      ?.listParticipantsByEventStatus ??
                  [])
              .length,
          itemBuilder: (context, index) {
            return item((state.participantsByEventStatusUpcomming
                    ?.listParticipantsByEventStatus ??
                [])[index]);
          },
        );
      },
    );
  }

  Widget item(ListParticipantsByEventStatus data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 180.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: XColors.primary),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                height: 170.h,
                width: 118.w,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  formatTime(data.createdAt.toString()),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    (data.event?.title ?? "").toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 180.w,
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Expanded(
                        child: Text(
                          (data.event?.location ?? "").toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatTime(String originalTime) {
    try {
      final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
      final outputFormat = DateFormat("d MMM, yyyy, h:mm a");
      final dateTime = inputFormat.parse(originalTime);
      return outputFormat.format(dateTime);
    } catch (e) {
      return "";
    }
  }
}
