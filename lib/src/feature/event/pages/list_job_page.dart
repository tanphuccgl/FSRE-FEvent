import 'package:fevent/src/feature/event/logic/job_bloc.dart';
import 'package:fevent/src/network/model/job.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ListJobPage extends StatelessWidget {
  final String eventId;
  const ListJobPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobBloc(eventId),
      child: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: XColors.primary,
              centerTitle: false,
              title: const Text(
                "Việc làm thêm",
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
            body: ListView.builder(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              shrinkWrap: true,
              itemCount: state.data?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return item(state.data!.data![index]);
              },
            ),
          );
        },
      ),
    );
  }

  Widget item(JobData data) {
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
                data.event?.image ??
                    "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
                height: 170.h,
                width: 118.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
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
                SizedBox(
                  width: 180.w,
                  child: Text(
                    data.position.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    "${data.salary}vnd/1h",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 180.w,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () => XCoordinator.showJobDetail(data),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: XColors.primary),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "CHI TIẾT",
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: XColors.primary),
                        ),
                      ),
                    ),
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
      final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "vi_VN");
      final outputFormat = DateFormat("d MMM, yyyy, h:mm a", "vi_VN");
      final dateTime = inputFormat.parse(originalTime);
      return outputFormat.format(dateTime);
    } catch (e) {
      return "";
    }
  }
}
