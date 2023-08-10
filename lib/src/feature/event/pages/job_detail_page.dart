import 'package:fevent/src/network/model/job.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class JobDetailPage extends StatelessWidget {
  final JobData data;
  const JobDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: XColors.primary,
        centerTitle: false,
        title: const Text(
          "Việc làm thêm",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 15,
          ),
          Image.network(
            data.event?.image ??
                "https://agendabrussels.imgix.net/004a2b71108438b08b4c2d39af2e4173770c6408.jpg",
            height: 128.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            (data.event?.title ?? "").toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              children: [
                const TextSpan(text: 'Thời gian diễn ra: '),
                TextSpan(
                  text: formatTime(data.createdAt.toString()),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              children: [
                const TextSpan(text: 'Công việc: '),
                TextSpan(
                  text: data.position.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              children: [
                const TextSpan(text: 'Tiền lương: '),
                TextSpan(
                  text: "${data.salary}vnd/1h",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              children: [
                const TextSpan(text: 'Thời gian sự kiến: '),
                TextSpan(
                  text: data.hourOfWork.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              children: [
                const TextSpan(text: 'Mô tả công việc: '),
                TextSpan(
                  text: data.description.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(text: 'Yêu cầu: '),
                TextSpan(
                  text: "",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (data.event?.status == "PUBLIC" &&
              (data.event?.remainingAmount ?? 0) > 0)
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(150, 55)),
                  onPressed: () =>
                      XCoordinator.showEventTwo(data.event?.eventId ?? ""),
                  child: const Text(
                    "Đăng ký",
                  )),
            ),
          const SizedBox(
            height: 45,
          ),
        ],
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
