import 'package:fevent/src/config/constants/images.dart';
import 'package:fevent/src/feature/my_user/enums/my_user_option.dart';

import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';

class MyUserPage extends StatelessWidget {
  const MyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GapHelper.h20,
            GestureDetector(
              onTap: () => XCoordinator.showProfile(),
              child: Row(
                children: [
                  const CircleAvatar(
                      backgroundImage: AssetImage(XImage.avatar), radius: 40),
                  GapHelper.w20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("NGUYEN VAN A",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                      GapHelper.h16,
                      const Text("anvse123456@fpt.edu.vn",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  )
                ],
              ),
            ),
            GapHelper.h70,
            const Text("Extensions",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            GapHelper.h12,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, i) => Column(
                children: [_item(MyUserOption.values[i])],
              ),
              itemCount: MyUserOption.values.length,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _item(MyUserOption option) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => option.onTap(),
            splashColor: XColors.primary.withOpacity(0.3),
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: XColors.primary,
                  ),
                  child: Icon(
                    option.iconOf,
                    color: Colors.white,
                    size: 20,
                  )),
              title: Text(option.labelOf,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ), // InkWell
        ),
        if (option != MyUserOption.logout)
          const Divider(
            color: Colors.black,
          )
      ],
    );
  }
}
