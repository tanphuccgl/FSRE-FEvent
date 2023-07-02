import 'package:fevent/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllEventPage extends StatelessWidget {
  const AllEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Row(children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    color: XColors.primary, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "All Event",
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
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        shrinkWrap: true,
        children: [
          _item(),
          _item(),
          _item(),
        ],
      ),
    );
  }

  Widget _item() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "29th Jan, 2022, 8:00 AM",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "Tết Holiday Event",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      "TPHCM, Viet Nam",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
