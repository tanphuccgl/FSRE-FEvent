import 'package:fevent/src/config/constants/images.dart';
import 'package:fevent/src/feature/my_user/cubit/profile_bloc.dart';
import 'package:fevent/src/router/coordinator.dart';
import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(context),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text("Hồ sơ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: XColors.primary))),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GapHelper.h70,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                        backgroundImage: AssetImage(XImage.avatar), radius: 40),
                    GapHelper.w20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.profile?.name ?? "",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            )),
                        GapHelper.h16,
                        Text(state.profile?.name ?? "",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    )
                  ],
                ),
                GapHelper.h70,
                _item(Icons.email, state.profile?.account?.email ?? ""),
                GapHelper.h40,
                _item(Icons.call, state.profile?.phone ?? ""),
                GapHelper.h40,
                _item(Icons.work, state.profile?.major ?? ""),
                GapHelper.h40,
                _item(Icons.message, "Khóa ${state.profile?.semester ?? ""}"),
                GapHelper.h70,
                ElevatedButton(
                    onPressed: () => XCoordinator.showUpdateProfile(),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(271.w, 58.h),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          // ignore: prefer_const_constructors
                          side: BorderSide(
                            color: XColors.primary,
                          )),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text("Sửa",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: XColors.primary))),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _item(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                icon,
                color: XColors.primary,
                size: 20,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              )),
        ),
      ],
    );
  }
}
