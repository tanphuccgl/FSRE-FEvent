import 'package:fevent/src/feature/job_request/logic/job_request_me_bloc.dart';
import 'package:fevent/src/network/model/job_request_me.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class JobRequestPage extends StatelessWidget {
  const JobRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobRequestMeBloc(),
      child: BlocBuilder<JobRequestMeBloc, JobRequestMeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
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
                        "Lịch sử công việc đã tham gia",
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
              body: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 45.h,
                          width: double.infinity,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Công việc đang chờ xét duyệt",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                _item((state.pending?.jobRequest ?? [])[index]),
                            itemCount: (state.pending?.jobRequest ?? []).length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 45.h,
                          width: double.infinity,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Công việc đã tham gia",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                _item((state.accept?.jobRequest ?? [])[index]),
                            itemCount: (state.accept?.jobRequest ?? []).length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget _item(JobRequest event) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 62.h,
        child: Row(
          children: [
            Container(
              width: 53.w,
              height: 53.w,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  event.content.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  (event.job?.description ?? "").toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  convertDateTimeToFormattedString(event.createdAt.toString()),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            if (event.status == "PENDING")
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Đang chờ xét duyệt",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                ),
              )
            else
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Đang xử lý",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange),
                ),
              )
          ],
        ),
      ),
    );
  }

  String convertDateTimeToFormattedString(String input) {
    try {
      final DateFormat inputFormat =
          DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ", "vi_VN");
      final DateFormat outputDateFormat = DateFormat.EEEE("vi_VN");
      final DateFormat outputTimeFormat = DateFormat.Hm("vi_VN");

      DateTime dateTime = inputFormat.parse(input);
      String formattedDate = outputDateFormat.format(dateTime);
      String formattedTime = outputTimeFormat.format(dateTime);

      return '$formattedDate, $formattedTime';
    } catch (e) {
      return "";
    }
  }
}
