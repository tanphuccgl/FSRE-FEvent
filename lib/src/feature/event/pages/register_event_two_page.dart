import 'package:fevent/src/feature/event/logic/register_event_two_bloc.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/radius.dart';
import 'package:fevent/src/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterEventTwoPage extends StatelessWidget {
  const RegisterEventTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterEventTwoBloc(),
      child: BlocBuilder<RegisterEventTwoBloc, RegisterEventTwoState>(
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
                const Center(
                  child: Text(
                    "Tết Holiday Event",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: XColors.primary,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "29 January, 2022",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Tuesday, 3:00 - 4:00PM",
                          style: TextStyle(
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
                const Text("Họ và tên :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: "",
                  hintText: "Họ và tên",
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
                  value: "",
                  hintText: "MSSV",
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
                const Text("Email :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: "",
                  hintText: "Email",
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
                const Text("Skill",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: "",
                  hintText: "Vui lòng chọn kỹ năng thích hợp",
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
                const Text("Chọn công việc",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                XInput(
                  value: "",
                  hintText: "Vui lòng chọn công việc",
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
                      onPressed: () => context.read<RegisterEventTwoBloc>(),
                      child: const Text("Đăng ký")),
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
}
