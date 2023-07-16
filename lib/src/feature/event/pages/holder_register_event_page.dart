import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';

class HolderRegisterEventPage extends StatelessWidget {
  const HolderRegisterEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: XColors.primary,
        centerTitle: false,
        title: const Text(
          "Chi tiết sự kiện",
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
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
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
              child: Text("Đăng ký tham gia sự kiện",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 7,
          ),
          const Divider(),
          const SizedBox(
            height: 55,
          ),
          const Divider(),
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: () => XCoordinator.showEventOne(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Đăng ký dưới dạng người tham gia sự kiện",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Divider(),
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: () => XCoordinator.showEventTwo(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Đăng ký dưới dạng người hỗ trợ sự kiện",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
