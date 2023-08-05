import 'package:fevent/src/feature/event/logic/register_event_one_bloc.dart';
import 'package:fevent/src/network/model/event/event_model.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RegisterEventOnePage extends StatelessWidget {
  final EventModel event;
  const RegisterEventOnePage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterEventOneBloc(event),
      child: BlocBuilder<RegisterEventOneBloc, RegisterEventOneState>(
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
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    event.title ?? "",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                              (event.startDate ?? "").toString()),
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
                              (event.startDate ?? "").toString(),
                              (event.endDate ?? "").toString()),
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
                const Divider(),
                const SizedBox(
                  height: 7,
                ),
                const Center(
                    child: Text("Xác nhận đăng ký",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 7,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    "Vui lòng kiểm tra lại thông tin đăng ký và bấm xác nhận",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 15,
                ),
                const Text("Họ và tên :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: state.name,
                  hintText: "Họ và tên",
                  onChanged: (value) =>
                      context.read<RegisterEventOneBloc>().onChangedName(value),
                  filled: true,
                  fillColor: XColors.bgGrey.withOpacity(0.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: XColors.bgGrey, width: 1),
                    borderRadius: BorderHelper.r10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("MSSV :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: state.code,
                  hintText: "MSSV",
                  filled: true,
                  onChanged: (value) =>
                      context.read<RegisterEventOneBloc>().onChangedCode(value),
                  fillColor: XColors.bgGrey.withOpacity(0.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: XColors.bgGrey, width: 1),
                    borderRadius: BorderHelper.r10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Số điện thoại :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: state.phone,
                  hintText: "Số điện thoại",
                  onChanged: (value) => context
                      .read<RegisterEventOneBloc>()
                      .onChangedPhone(value),
                  filled: true,
                  keyboardType: TextInputType.number,
                  fillColor: XColors.bgGrey.withOpacity(0.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: XColors.bgGrey, width: 1),
                    borderRadius: BorderHelper.r10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Email :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: state.email,
                  onChanged: (value) => context
                      .read<RegisterEventOneBloc>()
                      .onChangedEmail(value),
                  hintText: "Email",
                  filled: true,
                  fillColor: XColors.bgGrey.withOpacity(0.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: XColors.bgGrey, width: 1),
                    borderRadius: BorderHelper.r10,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          maximumSize: const Size(150, 55)),
                      onPressed: () => context
                          .read<RegisterEventOneBloc>()
                          .onRegisterButton(context),
                      child: const Text(
                        "Đăng ký",
                      )),
                ),
                const SizedBox(
                  height: 25,
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
      String formattedDate = DateFormat('d MMMM, yyyy').format(localDateTime);
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

      String dayOfWeek = DateFormat('EEEE').format(startDateTime);
      String startTime = DateFormat('h:00 a').format(startDateTime);
      String endTime = DateFormat('h:00 a').format(endDateTime);

      return '$dayOfWeek, $startTime - $endTime';
    } catch (e) {
      return "";
    }
  }
}
